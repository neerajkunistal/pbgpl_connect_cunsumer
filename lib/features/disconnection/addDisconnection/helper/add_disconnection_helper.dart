import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/model/bp_number_model.dart';
import 'package:customer_connect/features/disconnection/addDisconnection/domain/model/disconnection_reason_type_model.dart';
import 'package:customer_connect/features/disconnection/addDisconnection/domain/model/disconnection_type_model.dart';
import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/service/Apis.dart';
import 'package:customer_connect/service/server_request.dart';
import 'package:customer_connect/utills/commonClass/user_info.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_error_widget.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_success_widget.dart';
import 'package:flutter/cupertino.dart';

class AddDisconnectionHelper {

  static Future<dynamic> textFieldValidation({
      required BuildContext context,
      required DisconnectionTypeModel disconnectionTypeData,
      required DisconnectionReasonType disconnectionReasonTypeData,
      required String requestDate,
      required String disconnectionRequestDate,
      required String other,
      required File file,
     }) async {

    try {
        if(disconnectionTypeData.name == null){
          SnackBarErrorWidget(context).show(message: "Please select disconnection type");
          return false;
        }
        else if(requestDate.isEmpty){
          SnackBarErrorWidget(context).show(message: "Please select request date");
          return false;
        }
        else if(disconnectionRequestDate.isEmpty){
          SnackBarErrorWidget(context).show(message: "Please select disconnection request date");
          return false;
        }
        else if(disconnectionReasonTypeData.name == null){
          SnackBarErrorWidget(context).show(message: "Please select disconnection reason type");
          return false;
        }
        else if(disconnectionReasonTypeData.id == "5" && other.isEmpty){
          SnackBarErrorWidget(context).show(message: "Please enter other");
          return false;
        }
        else if(file.path.isEmpty){
          SnackBarErrorWidget(context).show(message: "Please select upload singed form");
          return false;
        }
        return true;
    }catch(_){}
    return false;
  }

  static Future<dynamic> submitData({
    required BuildContext context,
    required DisconnectionTypeModel disconnectionTypeData,
    required DisconnectionReasonType disconnectionReasonTypeData,
    required String requestDate,
    required String disconnectionRequestDate,
    required String other,
    required BPNumberModel bpNumberData,
    required File file,
  }) async {

    try {

      LoginModel userData = UserInfo.instanceInit()!.userData!;
      var json = {
        "schema" :  userData.schema.toString(),
        "dma_id" : bpNumberData.customerData!.id.toString(),
        "bp_number" : bpNumberData.customerData!.bpNumber.toString(),
        "disconnection_type" : disconnectionTypeData.id.toString(),
        "disconnection_req_date" : requestDate.toString(),
        "disconnection_reason" : disconnectionReasonTypeData.id.toString(),
        "other_reason" : other.toString(),
        "disconnection_over_date" :disconnectionRequestDate.toString(),
      };
      String url =  Apis.saveDisReqFormApi;
      var res =  await ServerRequest.postDataWithFile(urlEndPoint: url, body: json,
        context: context, keyWord: "meter_image_file", filePath: file.path.toString(),);
      if(res != null && res['status'] != null && res['status'] == 200 && res['messages'] != null){
        SnackBarSuccessWidget(context).show(message: res['messages'].toString());
        return res;
      } else  if(res != null &&  res['messages'] != null){
        SnackBarErrorWidget(context).show(message: res['messages'].toString().replaceAll("{", "").toString().replaceAll("}", ""));
      } else {
        SnackBarErrorWidget(context).show(message:"Internal server error");
      }
      return null;

    }catch(e){
      print(e.toString());
      return null;
    }

  }


}