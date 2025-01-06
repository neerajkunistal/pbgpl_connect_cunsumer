import 'dart:convert';

import 'package:customer_connect/service/Apis.dart';
import 'package:customer_connect/service/server_request.dart';
import 'package:customer_connect/utills/commonWidgets/password_validation.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_error_widget.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_success_widget.dart';
import 'package:flutter/cupertino.dart';

class ForgetPasswordHelper {

  static Future<dynamic> textFieldValidation({
    required BuildContext context,
    required String newPassword,
    required String confirmPassword,
  }) async {
      try {
           if(newPassword.isEmpty){
             SnackBarErrorWidget(context).show(message: "Please enter new password");
             return false;
           } else if(confirmPassword.isEmpty){
             SnackBarErrorWidget(context).show(message: "Please enter confirm password");
             return false;
           } else if(confirmPassword != newPassword){
             SnackBarErrorWidget(context).show(message: "Please new password and confirm password not matched");
             return false;
           } else if (await PasswordValidation.checkStrongPassword(
               password: confirmPassword) ==
               false) {
             SnackBarErrorWidget(!context.mounted ? context: context).show(message:"Please enter strong password (Test12@ At least 8 characters") ;
             return false;
           }
           return true;
      }catch(_){}
      return false;
  }

  static Future<dynamic> submit({
    required BuildContext context,
    required String bpNumber,
    required String schema,
    required String otp,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      String url =  Apis.resetPassword;
      var json = {
        "schema": "${schema}",
        "bp_number":"${bpNumber}",
        "otp":"${otp}",
        "new_password":"${newPassword}",
        "confirm_password":"${confirmPassword}"
      };
      var res =  await ServerRequest.postData(urlEndPoint: url,
              body: jsonEncode(json), context: context);
      if(res !=  url && res ['status'] == 200 && res['messages'] != null){
        SnackBarSuccessWidget(context).show(message: res['messages'].toString());
        return res;
      } else {
        SnackBarErrorWidget(context).show(message: res['messages'].toString());
        return res;
      }
    }catch(_){}
    return null;
  }

}
