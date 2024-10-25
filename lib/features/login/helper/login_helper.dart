import 'dart:convert';

import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/service/Apis.dart';
import 'package:customer_connect/service/api_server.dart';
import 'package:customer_connect/utills/common_widget/custom_toast.dart';
import 'package:flutter/cupertino.dart';

class LoginHelper{

  static Future<dynamic> textFieldValidation({required String bpNumber, required String password, required BuildContext context}) async{
    try{
      if(bpNumber.isEmpty){
        CustomToast.showToast("Please enter bp number");
        return false;
      } else if(password.isEmpty){
        CustomToast.showToast("Please enter password");
        return false;
      }
      return true;
    }catch(e){
      CustomToast.showToast(e.toString());
      return false;
    }
  }

  static Future<LoginModel?> loginApiData({required LoginRequestModel loginRequestModel, required BuildContext context}) async {


    try{
      final jsonString = json.encode(loginRequestModel);
      print("jsonString--->"+jsonString);
      var res = await ApiIntegration.postData(endPoint: Apis.login,body:jsonString, context : context);
      print("res-->"+res.toString());
      if(res != null){
        return LoginModel.fromJson(res);
      } else{
        print("No data Found");
        return null;
      }
    }catch(e){
      print("catch-->"+e.toString());
      CustomToast.showToast(e.toString());
      return null;
    }
  }

}