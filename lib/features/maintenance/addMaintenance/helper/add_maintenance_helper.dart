import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/model/bp_number_model.dart';
import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/features/maintenance/addMaintenance/domain/model/maintenance_service_type.dart';
import 'package:customer_connect/service/Apis.dart';
import 'package:customer_connect/service/server_request.dart';
import 'package:customer_connect/utills/commonClass/user_info.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_error_widget.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_success_widget.dart';
import 'package:flutter/material.dart';

class AddMaintenanceHelper {

  static Future<dynamic> textFieldValidation({required BuildContext context,
     required MaintenanceServiceTypeModel serviceTypeData,
     required String requestDate,
     required String message,
     required File file,
   }) async {

      try {
          if(serviceTypeData.service == null){
            SnackBarErrorWidget(context).show(message: "Please select service type");
            return false;
          }
          else if(requestDate.isEmpty){
            SnackBarErrorWidget(context).show(message: "Please select request date");
            return false;
          }
          else if(message.isEmpty){
            SnackBarErrorWidget(context).show(message: "Please select message");
            return false;
          }
          else if(file.path.isEmpty){
            SnackBarErrorWidget(context).show(message: "Please select file");
            return false;
          }
          return true;
      }catch(_){}
      return false;
  }

  static Future<dynamic> submitData({required BuildContext context,
    required MaintenanceServiceTypeModel serviceTypeData,
    required String requestDate,
    required String message,
    required File file,
    required BPNumberModel bpNumberData,
  }) async {

    try {
      LoginModel userData = UserInfo.instanceInit()!.userData!;
      var json = {
        "schema" :  userData.schema.toString(),
        "bpNumber" : bpNumberData.customerData!.bpNumber.toString(),
        "serviceType" : serviceTypeData.id.toString(),
        "dateOfRequest" : requestDate.toString(),
        "message" : message.toString(),
      };
      String url =  Apis.saveModificationFormApi;
      var res =  await ServerRequest.postDataWithFile(urlEndPoint: url, body: json,
        context: context, keyWord: "supportFile", filePath: file.path.toString(),);
      if(res != null && res['status'] != null && res['status'] == 200 && res['messages'] != null){
        SnackBarSuccessWidget(context).show(message: res['messages'].toString());
        return res;
      } else  if(res != null &&  res['messages'] != null){
        SnackBarErrorWidget(context).show(message: res['messages'].toString().replaceAll("{", "").toString().replaceAll("}", ""));
      } else {
        SnackBarErrorWidget(context).show(message:"Internal server error");
      }
      return null;
    }catch(_){}
    return null;
  }

  static Future<dynamic> fetchServiceType({
    required String schema}) async {
    try {
       String url = Apis.getServicesTypeApi;
       var json = {
         "schema" : schema
       };
       var res =  await ServerRequest.postDataForm(urlEndPoint: url, body: json);
       if(res != null && res['status'] == 200 && res['data'] != null){
         return maintenanceServiceListResponse(res['data']);
       }
    }catch(_){}
    return null;
  }

}