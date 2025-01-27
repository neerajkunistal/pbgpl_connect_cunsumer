import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/complaint/addComplaint/domain/bloc/add_complaint_bloc.dart';
import 'package:customer_connect/features/complaint/addComplaint/domain/model/category_model.dart';
import 'package:customer_connect/features/complaint/addComplaint/domain/model/sub_category_model.dart';
import 'package:customer_connect/features/dashboard/helper/dashboard_helper.dart';
import 'package:customer_connect/utills/commonWidgets/center_loader_widget.dart';
import 'package:customer_connect/utills/commonWidgets/dotted_loader_widget.dart';
import 'package:customer_connect/utills/commonWidgets/dropdown_widget.dart';
import 'package:flutter/material.dart';

class AddComplaintPage extends StatefulWidget {
  const AddComplaintPage({super.key});

  @override
  State<AddComplaintPage> createState() => _AddComplaintPageState();
}

class _AddComplaintPageState extends State<AddComplaintPage> {

  @override
  void initState() {
    BlocProvider.of<AddComplaintBloc>(context)
        .add(AddComplaintPageLoadEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: AppColor.themeSecondary
        ),
        title: TextWidget(
          AppString.addComplaint,
          color: AppColor.themeSecondary,
          fontWeight: FontWeight.w600,
          fontSize: AppFont.font_16,
        ),
      ),
      body: BlocBuilder<AddComplaintBloc, AddComplaintState>(
        builder: (context, state) {
          if(state is FetchAddComplaintDataState){
            return _builder(dataState: state);
          } else {
            return const Center(child: CenterLoaderWidget(),);
          }
        },
      ),
    );
  }

  Widget _builder({required FetchAddComplaintDataState dataState}) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _verticalSize(),
            _complaintCategoryDropDown(dataState: dataState),
            _verticalSize(),
            _subCategoryDropDown(dataState: dataState),
            _verticalSize(),
            _descriptionController(dataState: dataState),
            _verticalSize(),
            _fileListWidget(dataState: dataState),
            _selectFile(dataState: dataState),
            _verticalSize(),
            _submitButton(dataState: dataState),
            _verticalSize(),
          ],
        ),
      ),
    );
  }

  Widget _complaintCategoryDropDown({required FetchAddComplaintDataState dataState}) {
    return DropdownWidget(
      dropdownValue: dataState.categoryData.id == null ? null : dataState.categoryData,
      isRequired: true,
      hint: AppString.complaintCategory,
      items: dataState.categoryList
          .map<DropdownMenuItem<CategoryModel>>((CategoryModel categoryModel)  {
            return DropdownMenuItem<CategoryModel>(
                value: categoryModel,
              child: TextWidget(categoryModel.title.toString()),
            );
      }).toList(),
      onChanged: (value) {
        BlocProvider.of<AddComplaintBloc>(context).add(AddComplaintSelectCategoryEvent(context: context,
            categoryData: value));
      },
    );
  }

  Widget _subCategoryDropDown({required FetchAddComplaintDataState dataState}) {
    return dataState.isSubCategoryLoader == false ?
    DropdownWidget(
        isRequired: true,
        dropdownValue: dataState.subCategoryData.id == null ? null : dataState.subCategoryData,
        onChanged: (value) {
          BlocProvider.of<AddComplaintBloc>(context)
              .add(AddComplaintSelectSubCategoryEvent(subCategoryData: value));
        },
        items: dataState.subCategoryList
            .map<DropdownMenuItem<SubCategoryModel>>((SubCategoryModel subCategoryData) {
              return DropdownMenuItem<SubCategoryModel>(
                  value: subCategoryData,
                  child: TextWidget(subCategoryData.title.toString()));
        }).toList(),
        hint: AppString.customerSubCategory
    ) : const DottedLoaderWidget();
  }

  Widget _descriptionController({required FetchAddComplaintDataState dataState}) {
    return TextFieldWidget(
        isRequired: true,
        controller: dataState.remarkController,
        maxLine: 3,
        labelText: AppString.description
    );
  }

  Widget _fileListWidget({required FetchAddComplaintDataState dataState}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dataState.fileList.length,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1,
            crossAxisCount: 3,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0),
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: <Widget>[
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.file(dataState.fileList[index], fit: BoxFit.fill,),
                ),
              ),
              Positioned(
                top: -1,
                right: -1,
                child: InkWell(
                    onTap: () => BlocProvider.of<AddComplaintBloc>(context)
                        .add(AddComplaintRemoveFileEvent(index: index)),
                    child: Icon(Icons.close,color: Colors.red[500],)),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _selectFile({required FetchAddComplaintDataState dataState}) {
    return dataState.fileList.isEmpty ?
    Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        child: DottedBorder(
          color: AppColor.themeColor,
          child: InkWell(
            onTap: () {
              mediaType(context: context,
                  onPressedCamera: () {
                    BlocProvider.of<AddComplaintBloc>(context)
                        .add(AddComplaintSelectFileEvent(context: context, mediaType: 1));
                    Navigator.pop(context);
                  },
                  onPressedGallery:() {
                    BlocProvider.of<AddComplaintBloc>(context)
                        .add(AddComplaintSelectFileEvent(context: context, mediaType: 2));
                    Navigator.pop(context);
                  }
              );
            },
            child: Padding(
              padding: EdgeInsets.all( MediaQuery.of(context).size.width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.perm_media_outlined,
                    color: AppColor.themeSecondary,
                    size: MediaQuery.of(context).size.width * 0.07,),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.02,
                  ),
                  TextWidget("Add Images",
                    textAlign: TextAlign.center,
                    fontSize: AppFont.font_10,),
                ],),
            )
          ),
        ),
      ),
    ) : const SizedBox.shrink();
  }

  Widget _submitButton({required FetchAddComplaintDataState dataState}) {
    return dataState.isLoader == false ?
    ButtonWidget(
        text: AppString.submit,
        onPressed: () {
          BlocProvider.of<AddComplaintBloc>(context)
          .add(AddComplaintSubmitEvent(context: context));
        }
    ): const DottedLoaderWidget();
  }

  Widget _verticalSize() {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.05,
    );
  }


}
