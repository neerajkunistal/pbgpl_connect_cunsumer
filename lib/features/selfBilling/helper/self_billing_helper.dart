import 'dart:async';
import 'dart:io';
import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/utills/commonClass/user_info.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_error_widget.dart';
import 'package:flutter/cupertino.dart';

class SelfBillingHelper {

  static Future<dynamic> textFiledValidationCheck({
    required BuildContext context,
    required String customerName,
    required String customerAddress,
    required String meterNumber,
    required String previousReading,
    required File file,
  }) async {

    try{
        if(customerName.isEmpty){
          SnackBarErrorWidget(context).show(message: "Please enter customer name");
          return false;
        }
        else if(customerAddress.isEmpty){
          SnackBarErrorWidget(context).show(message: "Please enter address");
          return false;
        }
        else if(meterNumber.isEmpty){
          SnackBarErrorWidget(context).show(message: "Please enter meter number");
          return false;
        }
        else if(previousReading.isEmpty){
          SnackBarErrorWidget(context).show(message: "Please enter previous reading");
          return false;
        }
        else if(file.path.isEmpty){
          SnackBarErrorWidget(context).show(message: "Please upload meter reading photo");
          return false;
        }
        return true;
    }catch(_){}
      return false;
  }

  static Future<dynamic> submitData({
    required BuildContext context,
    required String bpNumber,
    required String customerName,
    required String customerAddress,
    required String meterNumber,
    required String previousReading,
    required File file,
  }) async {

    try {

      // meter_image_file

      LoginModel userData =  UserInfo.instance!.userData!;
      var json = {
        "bpNumber" : bpNumber,
        "meter_reading" : "",
        "generate_by_customer" : "1",
        "meter_serial" : meterNumber,
        "schema" : userData.schema.toString(),
      };

    }catch(_){}
  }

}