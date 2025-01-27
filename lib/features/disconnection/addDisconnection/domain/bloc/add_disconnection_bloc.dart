
import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:customer_connect/features/dashboard/domain/model/bp_number_model.dart';
import 'package:customer_connect/features/dashboard/helper/dashboard_helper.dart';
import 'package:customer_connect/features/disconnection/addDisconnection/domain/model/disconnection_reason_type_model.dart';
import 'package:customer_connect/features/disconnection/addDisconnection/domain/model/disconnection_type_model.dart';
import 'package:customer_connect/features/disconnection/addDisconnection/helper/add_disconnection_helper.dart';
import 'package:flutter/material.dart';

part 'add_disconnection_event.dart';
part 'add_disconnection_state.dart';

class AddDisconnectionBloc extends Bloc<AddDisconnectionEvent, AddDisconnectionState> {

  bool isLoader =  false;
  List<DisconnectionTypeModel> disconnectionTypeList = [];
  List<DisconnectionReasonType> disconnectionReasonTypeList = [];
  DisconnectionTypeModel disconnectionTypeData =  DisconnectionTypeModel();
  DisconnectionReasonType disconnectionReasonTypeData =  DisconnectionReasonType();
  TextEditingController bpNumberController =  TextEditingController();
  TextEditingController requestDateController =  TextEditingController();
  TextEditingController disconnectionRequestController =  TextEditingController();
  TextEditingController disconnectionReasonController =  TextEditingController();
  File file =  File("");
  BPNumberModel _bpNumberData =  BPNumberModel();
  BPNumberModel get bpNumberData =>  _bpNumberData;

  AddDisconnectionBloc() : super(AddDisconnectionInitial()) {
    on<AddDisconnectionPageLoadEvent>(_pageLoad);
    on<AddDisconnectionSelectDisconnectionTypeEvent>(_selectDisconnectionType);
    on<AddDisconnectionSelectDisconnectionReasonTypeEvent>(_selectDisconnectionReasonType);
    on<AddDisconnectionSelectFileEvent>(_selectFile);
    on<AddDisconnectionSelectRequestDateEvent>(_selectRequestDate);
    on<AddDisconnectionSelectDisconnectionRequestDateEvent>(_selectDisconnectionRequestDate);
    on<AddDisconnectionSubmitEvent>(_submit);
  }

  _pageLoad(AddDisconnectionPageLoadEvent event, emit) async {
    emit(AddDisconnectionPageLoadState());
    isLoader =  false;
    disconnectionTypeList = DisconnectionTypeModel().getData();
    disconnectionTypeData =  DisconnectionTypeModel();
    disconnectionReasonTypeList = DisconnectionReasonType().getData();
    disconnectionReasonTypeData =  DisconnectionReasonType();
    requestDateController.text = "";
    disconnectionRequestController.text = "";
    disconnectionReasonController.text = "";
    file =  File("");
    _bpNumberData =  BlocProvider.of<DashboardBloc>(event.context).bpNumberData;
    _eventComplete(emit);
  }

  _selectDisconnectionType(AddDisconnectionSelectDisconnectionTypeEvent event, emit) {
    disconnectionTypeData =  event.disconnectionTypeData;
    _eventComplete(emit);
  }

  _selectDisconnectionReasonType(AddDisconnectionSelectDisconnectionReasonTypeEvent event, emit) {
    disconnectionReasonTypeData =  event.disconnectionReasonTypeData;
    _eventComplete(emit);
  }

  _selectRequestDate(AddDisconnectionSelectRequestDateEvent event, emit) async {
    BuildContext context =  event.context;
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101)
    );
    if (picked != null) {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      String dateTime = formatter.format(picked);
      requestDateController.text =  dateTime.toString();
      disconnectionRequestController.text = "";
    }
    _eventComplete(emit);
  }

  _selectDisconnectionRequestDate(AddDisconnectionSelectDisconnectionRequestDateEvent event, emit) async {
    BuildContext context =  event.context;
    DateTime dateTime =  DateTime.now();
    if(requestDateController.text.toString().isNotEmpty){
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      dateTime = formatter.parse(requestDateController.text.toString());
    }
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: dateTime,
        lastDate: DateTime(2101)
    );
    if (picked != null) {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      String dateTime = formatter.format(picked);
      disconnectionRequestController.text =  dateTime.toString();
    }
    _eventComplete(emit);
  }

  _selectFile(AddDisconnectionSelectFileEvent event, emit) async {
    int mediaType =  event.mediaType;
    print(mediaType);
    if(mediaType == 1){
      var res =  await DashboardHelper.cameraPiker(context: event.context);
      if(res !=  null){
        file =  res;
        _eventComplete(emit);
      }
    } else if(mediaType == 2){
      var res =  await DashboardHelper.filePiker(context: event.context);
      if(res !=  null){
        file =  res;
        _eventComplete(emit);
      }
    }
  }

  _submit(AddDisconnectionSubmitEvent event, emit) async {

    BuildContext context =  event.context;
    var textFieldValidation =  await AddDisconnectionHelper.textFieldValidation(context:context,
        disconnectionTypeData: disconnectionTypeData,
        disconnectionReasonTypeData: disconnectionReasonTypeData,
        requestDate: requestDateController.text.toString(),
        disconnectionRequestDate: disconnectionRequestController.text.toString(),
        other: disconnectionReasonController.text.toString(), file: file);
    if(textFieldValidation == false){
      return;
    }

    isLoader =  true;
    _eventComplete(emit);
    var res =  await AddDisconnectionHelper.submitData(context:context,
        disconnectionTypeData: disconnectionTypeData,
        disconnectionReasonTypeData: disconnectionReasonTypeData,
        requestDate: requestDateController.text.toString(),
        disconnectionRequestDate: disconnectionRequestController.text.toString(),
        other: disconnectionReasonController.text.toString(),
        bpNumberData: bpNumberData, file: file);
    if(res != null){
      disconnectionTypeData =  DisconnectionTypeModel();
      disconnectionReasonTypeData =  DisconnectionReasonType();
      requestDateController.text = "";
      disconnectionRequestController.text = "";
      disconnectionReasonController.text = "";
    }
    isLoader =  false;
    _eventComplete(emit);
  }

  _eventComplete(Emitter<AddDisconnectionState> emit){
    emit(FetchAddDisconnectionDataState(
        isLoader: isLoader,
        file: file,
        bpNumberController: bpNumberController,
        disconnectionReasonController: disconnectionReasonController,
        disconnectionReasonTypeData: disconnectionReasonTypeData,
        disconnectionReasonTypeList: disconnectionReasonTypeList,
        disconnectionRequestController: disconnectionRequestController,
        disconnectionTypeData: disconnectionTypeData,
        disconnectionTypeList: disconnectionTypeList,
        requestDateController: requestDateController,
        bpNumberData: bpNumberData,)
    );
  }

}