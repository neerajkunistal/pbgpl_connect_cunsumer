import 'dart:convert';

import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/service/Apis.dart';
import 'package:customer_connect/service/server_request.dart';
import 'package:customer_connect/utills/commonClass/user_info.dart';
import 'package:customer_connect/utills/commonWidgets/password_validation.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_error_widget.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_success_widget.dart';
import 'package:flutter/material.dart';

class ChangePasswordHelper {
  static Future<dynamic> textFieldValidationCheck(
      {required String oldPassword,
      required String newPassword,
      required String confirmPassword,
      required BuildContext context}) async {
    try {
      if (oldPassword.isEmpty) {
        SnackBarErrorWidget(!context.mounted ? context: context).show(message: "Please enter old password");
        return false;
      } else if (newPassword.isEmpty) {
        SnackBarErrorWidget(!context.mounted ? context: context).show(message:"Please enter new password");
        return false;
      } else if (confirmPassword.isEmpty) {
        SnackBarErrorWidget(!context.mounted ? context: context).show(message:"Please enter confirm password");
        return false;
      } else if (confirmPassword.toString() != newPassword.toString()) {
        SnackBarErrorWidget(!context.mounted ? context: context).show(message:"new password and confirm password do not match");
        return false;
      } else if (await PasswordValidation.checkStrongPassword(
              password: confirmPassword) ==
          false) {
        SnackBarErrorWidget(!context.mounted ? context: context).show(message:"Please enter strong password (Test12@ At least 8 characters") ;
        return false;
      } else if (await PasswordValidation.checkStrongPassword(
          password: confirmPassword) ==
          false) {
        SnackBarErrorWidget(!context.mounted ? context: context).show(message:"Please enter strong password (Example@123 At least 8 characters") ;
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<dynamic> passwordSaveOnServer({
      required String oldPassword,
      required String newPassword,
      required String confirmPassword,
      required BuildContext context}) async {

    try{
      LoginModel userData =  UserInfo.instance!.userData!;
       String url = Apis.changePassword;
       var json = {
         "bp_number" : userData.bpNumber.toString(),
         "schema" : userData.schema.toString(),
         "new_password" : newPassword,
         "old_password" : oldPassword,
         "confirm_password" : confirmPassword,
      };
      var res =  await ServerRequest.postData(urlEndPoint: url, body: jsonEncode(json), context: context);
      if(res != null && res['status'] != null
          && res['status'] == 200 && res['messages'] != null && res['error'] == false){
        SnackBarSuccessWidget(!context.mounted ? context : context).show(message: res['messages']);
        return res;
      } if(res != null && res['status'] != null
          && res['status'] == 200 && res['messages'] != null && res['error'] == true) {
        SnackBarErrorWidget(!context.mounted ? context : context).show(
            message: res['messages']);
      }
       return null;
    }catch(_){
      SnackBarErrorWidget(!context.mounted ? context : context).show(message: "Internal server error");
      return null;
    }
  }
}
