import 'dart:async';
import 'dart:io';

import 'package:customer_connect/features/dashboard/domain/model/customer_model.dart';
import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/features/selfBilling/domain/model/meter_model.dart';
import 'package:customer_connect/features/selfBilling/presentation/widget/self_billing_preview_widget.dart';
import 'package:customer_connect/service/Apis.dart';
import 'package:customer_connect/service/location/location_helper.dart';
import 'package:customer_connect/service/location/location_model.dart';
import 'package:customer_connect/service/server_request.dart';
import 'package:customer_connect/utills/commonClass/user_info.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_error_widget.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_success_widget.dart';
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
      if(meteRes != null && meteRes['success'] != null && meteRes['success']== "200") {
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
    required MeterModel meterData,
    required CustomerModel customerData,
    required  String currentReading,
    required  String previousReading,
    required File file,
  }) async {
    try {
      var location = await LocationHelper.getLocation(context: context);
      LocationModel locationData = LocationModel();
      if (location != null) {
        locationData = location;
      } else {
        SnackBarErrorWidget(context).show(message: "Invalid location");
        return null;
      }
      LoginModel userData = UserInfo.instanceInit()!.userData!;
      var json = {
        "meter_serial" : meterData.serialNumber.toString(),
        "meter_reading" : meterData.currentMeterReading.toString(),
        "meter_number" : meterData.meterNumber.toString(),
        "billing_cycle_period" : meterData.billingCyclePeriods.toString(),
        "schema" :  userData.schema.toString(),
        "dma_id" : customerData.id.toString(),
        "bill_lat" : locationData.lat.toString(),
        "bill_long" : locationData.long.toString(),
      };
      String url = Apis.saveSelfBillingApi;
      var res =  await ServerRequest.postDataWithFile(urlEndPoint: url, body: json,
        context: context, keyWord: "meter_image_file", filePath: file.path.toString(),);
      if(res != null && res['status'] != null && res['status'] == "success" && res['message'] != null){
        SnackBarSuccessWidget(context).show(message: res['message'].toString());
        return res;
      } else  if(res != null && res['status'] != null && res['status'] == "error" && res['message'] != null){
        SnackBarErrorWidget(context).show(message: res['message'].toString().replaceAll("{", "").toString().replaceAll("}", ""));
      } else {
        SnackBarErrorWidget(context).show(message:"Internal server error");
      }
      return null;
    }catch(_){}
    return null;
  }

}