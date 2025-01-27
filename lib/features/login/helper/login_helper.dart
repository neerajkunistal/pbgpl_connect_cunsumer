import 'dart:convert';

import 'package:customer_connect/features/login/domain/model/ga_model.dart';
import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/features/login/presentation/widget/city_widget.dart';
import 'package:customer_connect/service/Apis.dart';
import 'package:customer_connect/service/server_request.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_error_widget.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_success_widget.dart';
import 'package:customer_connect/utills/common_widget/custom_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginHelper {
  static Future<dynamic> textFieldValidation(
      {required String bpNumber,
      required String password,
      required BuildContext context}) async {
    try {
      if (bpNumber.isEmpty) {
        CustomToast.showToast("Please enter Mobile No / CR No. TR No");
        return false;
      } else if (password.isEmpty) {
        CustomToast.showToast("Please enter password");
        return false;
      }
      return true;
    } catch (e) {
      CustomToast.showToast(e.toString());
      return false;
    }
  }

  static String validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return "";
  }

  static Future<dynamic> checkMobileNumber({
    required String mobileNumber, required BuildContext context}) async {
    try{
       String url = Apis.loginOtp+"?mobile_number=${mobileNumber}";
       var res =  await ServerRequest.getData(urlEndPoint: url);
       if(res != null){
         List<GaModel> gaList =  gaListResponse(res);
         if(gaList.isNotEmpty && gaList.length == 1){
           return await sendOtp(mobileNumber: mobileNumber, schema: gaList[0].schema.toString(),
               context: context);
         } else if(gaList.isNotEmpty && gaList.length > 1){
           var listRes =  await showCitySheet(list: gaList, context: context);
           return await sendOtp(mobileNumber: mobileNumber, schema: gaList[listRes].schema.toString(),
               context: context);
         }
       }
       return null;
    }catch(_){}
    return null;
  }

  static Future<dynamic> sendOtp({
    required String mobileNumber, required String schema, required BuildContext context}) async {
    try{
      String url = Apis.loginOtp+"?mobile_number=${mobileNumber}&schema=${schema}";
      var res =  await ServerRequest.getData(urlEndPoint: url);
      if(res != null && res['status'] != null && res['status'] == "success"){
        SnackBarSuccessWidget(context).show(message: res['message']);
        return schema;
      }
      return null;
    }catch(_){}
    return null;
  }

  static Future<dynamic> forgetPassword({
    required String bpNumber, required BuildContext context}) async {
    try{
      String url = Apis.forgotPassword;
      var json = {
        "bp_number" : bpNumber
      };
      var res =  await ServerRequest.postData(urlEndPoint: url,
          body: jsonEncode(json), context: context);
      if(res != null && res['status'] != null
          && res['status'] == "success" && res['schema'] != null && res['mobile'] != null){
        SnackBarSuccessWidget(context).show(message: res['message']);
        return {
          "schema" : res['schema'].toString(),
          "mobile" : res['mobile'].toString(),
        };
      }  else {
        SnackBarSuccessWidget(context).show(message: res['message']); // mobile
      }
      return null;
    }catch(_){}
    return null;
  }

  static Future<dynamic> loginApiData(
      {required LoginRequestModel loginRequestModel,
      required BuildContext context}) async {
    try {
      final jsonString = json.encode(loginRequestModel);
      print("jsonString--->" + jsonString);
      print("Ulr--->" + Apis.login);
      var res = await ServerRequest.postData(urlEndPoint: Apis.login,
           body: jsonString, context: context);
      print("res-->" + res.toString());
      if (res != null && res['users'] != null) {
        return loginResponse(res['users']);
      } else if(res != null && res['error'] == true) {
        SnackBarErrorWidget(context).show(message: res['messages'].toString());
      }
      return null;
    } catch (e) {
      print("catch-->" + e.toString());
      CustomToast.showToast(e.toString());
      return null;
    }
  }
}
