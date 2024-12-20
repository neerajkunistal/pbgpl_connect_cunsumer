import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/complaint/addComplaint/domain/model/category_model.dart';
import 'package:customer_connect/features/complaint/addComplaint/domain/model/sub_category_model.dart';
import 'package:customer_connect/features/complaint/addComplaint/helper/add_complaint_helper.dart';
import 'package:customer_connect/features/dashboard/helper/dashboard_helper.dart';
import 'package:flutter/cupertino.dart';

part 'add_complaint_event.dart';
part 'add_complaint_state.dart';

class AddComplaintBloc extends Bloc<AddComplaintEvent, AddComplaintState> {

  bool isLoader = false;
  bool isSubCategoryLoader =  false;
  List<CategoryModel> categoryList =[];
  CategoryModel categoryData =  CategoryModel();
  List<SubCategoryModel> subCategoryList = [];
  SubCategoryModel subCategoryData =  SubCategoryModel();
  List<File> fileList = [];
  TextEditingController remarkController =  TextEditingController();


  AddComplaintBloc() : super(AddComplaintInitial()) {
    on<AddComplaintPageLoadEvent>(_pageLoadEvent);
    on<AddComplaintSelectCategoryEvent>(_selectCategory);
    on<AddComplaintSelectSubCategoryEvent>(_subCategory);
    on<AddComplaintSelectFileEvent>(_selectFile);
    on<AddComplaintRemoveFileEvent>(_removeFileIndex);
    on<AddComplaintSubmitEvent>(_submit);
  }

  _pageLoadEvent(AddComplaintPageLoadEvent event, emit) async {
    emit(AddComplaintPageLoadState());
    isLoader =  false;
    isSubCategoryLoader =  false;
    categoryList = [];
    subCategoryList = [];
    categoryData =  CategoryModel();
    subCategoryData =  SubCategoryModel();
    fileList = [];
    remarkController.text = "";

    var res =  await AddComplaintHelper.fetchCategoryData();
    if(res != null){
      categoryList = res;
    }

    _eventComplete(emit);
  }

  _selectCategory(AddComplaintSelectCategoryEvent event, emit) async {
    categoryData =  event.categoryData;
    subCategoryData =  SubCategoryModel();
    subCategoryList = [];
    isSubCategoryLoader =  true;
    _eventComplete(emit);
    var res =  await AddComplaintHelper.fetchSubCategoryData(categoryData: categoryData);
    if(res != null){
      subCategoryList =  res;
    }
    isSubCategoryLoader =  false;
    _eventComplete(emit);
  }

  _subCategory(AddComplaintSelectSubCategoryEvent event, emit) {
     subCategoryData =  event.subCategoryData;
     _eventComplete(emit);
  }

  _selectFile(AddComplaintSelectFileEvent event, emit) async {
    int mediaType =  event.mediaType;
    isLoader =  true;
    _eventComplete(emit);
    if(mediaType == 1){
      var res =  await DashboardHelper.cameraPiker(context: event.context);
      if(res !=  null){
         fileList.add(res);
      }
    } else if(mediaType == 2){
      var res =  await DashboardHelper.filePiker(context: event.context);
      if(res !=  null){
        fileList.add(res);
      }
    }
    isLoader =  false;
    _eventComplete(emit);
  }

  _removeFileIndex(AddComplaintRemoveFileEvent event, emit) {
    int index =  event.index;
    isLoader =  true;
    _eventComplete(emit);
    fileList.removeAt(index);
    isLoader =  false;
    _eventComplete(emit);
  }

  _submit(AddComplaintSubmitEvent event, emit) async {

    var textFiledValidationCheck =  await AddComplaintHelper.textFiledValidationCheck(context: event.context,
        categoryData: categoryData, subCategoryData: subCategoryData, description: remarkController.text.toString());
    if(textFiledValidationCheck == false){
      return;
    }

    isLoader =  true;
    _eventComplete(emit);
    var res =  await AddComplaintHelper.submitData(context: !event.context.mounted ? event.context : event.context,
        categoryData: categoryData, subCategoryData: subCategoryData,
        description: remarkController.text.toString(), files: fileList);
    if(res != null){
      subCategoryData =  SubCategoryModel();
      categoryData =  CategoryModel();
      remarkController.text = "";
      fileList = [];
    }
    isLoader =  false;
    _eventComplete(emit);

  }

  _eventComplete(Emitter<AddComplaintState>emit) {
    emit(FetchAddComplaintDataState(
        isLoader: isLoader,
        isSubCategoryLoader: isSubCategoryLoader,
        fileList: fileList,
        remarkController: remarkController,
        categoryData: categoryData,
        categoryList: categoryList,
        subCategoryData: subCategoryData,
        subCategoryList: subCategoryList,
    ));
  }

}
