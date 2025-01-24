import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/maintenance/addMaintenance/domain/model/disconnection_reason_type_model.dart';
import 'package:customer_connect/features/maintenance/addMaintenance/domain/model/disconnection_type_model.dart';
import 'package:flutter/cupertino.dart';

part 'add_maintenance_event.dart';
part 'add_maintenance_state.dart';

class AddMaintenanceBloc extends Bloc<AddMaintenanceEvent, AddMaintenanceState> {

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

  AddMaintenanceBloc() : super(AddMaintenanceInitial()) {
    on<AddMaintenancePageLoadEvent>(_pageLoad);
  }

  _pageLoad(AddMaintenancePageLoadEvent event, emit) async {
    emit(AddMaintenancePageLoadState());
    isLoader =  false;
    disconnectionTypeList = [];
    disconnectionTypeData =  DisconnectionTypeModel();
    disconnectionReasonTypeList = [];
    disconnectionReasonTypeData =  DisconnectionReasonType();
    _eventComplete(emit);
  }

  _eventComplete(Emitter<AddMaintenanceState> emit){
    emit(FetchAddMaintenanceDataState(
        isLoader: isLoader,
        file: file,
        bpNumberController: bpNumberController,
        disconnectionReasonController: disconnectionReasonController,
        disconnectionReasonTypeData: disconnectionReasonTypeData,
        disconnectionReasonTypeList: disconnectionReasonTypeList,
        disconnectionRequestController: disconnectionRequestController,
        disconnectionTypeData: disconnectionTypeData,
        disconnectionTypeList: disconnectionTypeList,
        requestDateController: requestDateController
       )
    );
  }

}
