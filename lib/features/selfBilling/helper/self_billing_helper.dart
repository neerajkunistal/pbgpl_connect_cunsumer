import 'dart:async';
import 'dart:io';
import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/features/selfBilling/domain/model/meter_model.dart';
import 'package:customer_connect/features/selfBilling/presentation/widget/self_billing_preview_widget.dart';
import 'package:customer_connect/service/Apis.dart';
import 'package:customer_connect/service/server_request.dart';
import 'package:customer_connect/utills/commonClass/user_info.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_error_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelfBillingHelper {

  static Future<dynamic> textFiledValidationCheck({
    required BuildContext context,
    required String previousReading,
    required String currentReading,
    required File file,
  }) async {

    try{
      if(currentReading.isEmpty){
          SnackBarErrorWidget(context).show(message: "Please enter current meter reading");
          return false;
        }
        else if(double.parse(currentReading) < double.parse(previousReading)){
          SnackBarErrorWidget(context).show(message: "Please enter valid meter reading");
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

  static Future<dynamic> fetchMeterNumber(
        {required String schema, required String dmaId}) async {
    try{
      String url =  Apis.getMeterNumber+"?schema=${schema}&dma_id=${dmaId}";
      var meteRes =  await ServerRequest.getData(urlEndPoint: url);
      if(meteRes != null && meteRes['success'] != null && meteRes['success']== "200" && meteRes['status'] == "success") {
        return meterDataResponse(meteRes);
      }
      return null;
    }catch(_){
      print(_.toString());
    }
    return null;
  }

  static Future<dynamic> fetchPrevReading(
      {required String schema, required String dmaId}) async {
    try{
      String url =  Apis.getMeterReading+"?schema=${schema}&dma_id=${dmaId}";
      var meteReadingRes =  await ServerRequest.getData(urlEndPoint: url);
      if(meteReadingRes != null && meteReadingRes['success'] != null && meteReadingRes['success'] == 200 ) {
        return meterDataResponse(meteReadingRes);
      }
    }catch(_){}
    return null;
  }

  static void selfBillingPreview({required BuildContext context}){
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (builder){
          return SelfBillingPreviewWidget(buildContext: context,);
        }
    );
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