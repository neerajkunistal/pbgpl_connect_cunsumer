import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:customer_connect/features/dashboard/domain/model/bp_number_model.dart';
import 'package:customer_connect/features/dashboard/helper/dashboard_helper.dart';
import 'package:customer_connect/features/disconnection/addDisconnection/domain/model/disconnection_reason_type_model.dart';
import 'package:customer_connect/features/disconnection/addDisconnection/domain/model/disconnection_type_model.dart';
import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/features/maintenance/addMaintenance/domain/model/maintenance_service_type.dart';
import 'package:customer_connect/features/maintenance/addMaintenance/helper/add_maintenance_helper.dart';
import 'package:customer_connect/utills/commonClass/user_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'add_maintenance_event.dart';
part 'add_maintenance_state.dart';

class AddMaintenanceBloc extends Bloc<AddMaintenanceEvent, AddMaintenanceState> {

  bool isLoader =  false;
  List<MaintenanceServiceTypeModel> serviceTypeList = [];
  MaintenanceServiceTypeModel serviceTypeData =  MaintenanceServiceTypeModel();
  TextEditingController bpNumberController =  TextEditingController();
  TextEditingController requestDateController =  TextEditingController();
  TextEditingController messageController =  TextEditingController();
  File file =  File("");

  BPNumberModel _bpNumberData =  BPNumberModel();
  BPNumberModel get bpNumberData =>  _bpNumberData;

  AddMaintenanceBloc() : super(AddMaintenanceInitial()) {
    on<AddMaintenancePageLoadEvent>(_pageLoad);
    on<AddMaintenanceSelectServiceTypeEvent>(_selectServiceType);
    on<AddMaintenanceSelectRequestDateEvent>(_selectRequestDate);
    on<AddMaintenanceSelectFileEvent>(_selectFile);
    on<AddMaintenanceSubmitEvent>(_submit);
  }

  _pageLoad(AddMaintenancePageLoadEvent event, emit) async {
    emit(AddMaintenancePageLoadState());
    isLoader =  false;
    serviceTypeList = [];
    messageController.text = "";
    requestDateController.text = "";
    serviceTypeData =  MaintenanceServiceTypeModel();
    _bpNumberData =  BlocProvider.of<DashboardBloc>(event.context).bpNumberData;
    LoginModel userData = UserInfo.instanceInit()!.userData!;
    var res =  await AddMaintenanceHelper.fetchServiceType(schema: userData.schema.toString());
    if(res != null){
      serviceTypeList =  res;
    }
    _eventComplete(emit);
  }

  _selectServiceType(AddMaintenanceSelectServiceTypeEvent event, emit) {
    serviceTypeData =  event.serviceTypeData;
    _eventComplete(emit);
  }

  _selectRequestDate(AddMaintenanceSelectRequestDateEvent event, emit) async {
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
    }
    _eventComplete(emit);
  }

  _selectFile(AddMaintenanceSelectFileEvent event, emit) async {
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

  _submit(AddMaintenanceSubmitEvent event, emit) async {

    BuildContext context =  event.context;
    var textFieldValidation =  await AddMaintenanceHelper.textFieldValidation(context: context,
        serviceTypeData: serviceTypeData, requestDate: requestDateController.text.toString(),
          message: messageController.text.toString(), file: file);
    if(textFieldValidation == false){
      return;
    }

    isLoader =  true;
    _eventComplete(emit);
    var res =  await AddMaintenanceHelper.submitData(context: context,
        serviceTypeData: serviceTypeData, requestDate: requestDateController.text.toString(),
        message: messageController.text.toString(), file: file, bpNumberData: bpNumberData);
    if(res != null){
      isLoader =  false;
      file =  File("");
      messageController.text = "";
      requestDateController.text = "";
      serviceTypeData =  MaintenanceServiceTypeModel();
    }
    isLoader =  false;
    _eventComplete(emit);
  }

  _eventComplete(Emitter<AddMaintenanceState> emit){
    emit(FetchAddMaintenanceDataState(
        isLoader: isLoader,
        file: file,
        bpNumberController: bpNumberController,
        messageController: messageController,
        serviceTypeData: serviceTypeData,
        serviceTypeList: serviceTypeList,
        requestDateController: requestDateController,
        bpNumberData: bpNumberData,
       )
    );
  }

}
