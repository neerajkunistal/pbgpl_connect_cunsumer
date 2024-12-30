import 'dart:convert';

import 'package:customer_connect/features/dashboard/domain/model/customer_model.dart';
import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/service/Apis.dart';
import 'package:customer_connect/service/server_request.dart';
import 'package:customer_connect/utills/commonClass/user_info.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_error_widget.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_success_widget.dart';
import 'package:flutter/material.dart';

class ProfileHelper{

  static Future<dynamic> otpSendUpdateMobile({required CustomerModel customerData,
  required String updateMobileNumber, required BuildContext context, required String otp
  }) async {
    try{
      LoginModel  userData =  UserInfo.instanceInit()!.userData!;
      String url =  Apis.updateMobileNumber;
      var json = {
        "current_mobile_number":"${customerData.mobileNumber}",
        "new_mobile_number":"${updateMobileNumber}",
        "otp": otp,
        "schema":"${userData.schema}",
        "changeType":"mobile"
      };
      var res =  await ServerRequest.postData(urlEndPoint: url, body: jsonEncode(json), context: context);
      if(res !=  null && res['status'] == "success" && res['message'] != null) {
         SnackBarSuccessWidget(context).show(message: res['message'].toString());
         return res;
      } else if(res !=  null && res['success'] == false && res['message'] != null) {
        SnackBarErrorWidget(context).show(message: res['message'].toString());
        return null;
      } else {
        SnackBarErrorWidget(context).show(message: res['message'].toString());
      }
      return null;
    }catch(_){}
    return null;
  }
}