import 'package:customer_connect/features/payment/addPayment/domain/model/payment_model.dart';
import 'package:customer_connect/features/payment/addPayment/domain/model/payment_status_model.dart';
import 'package:customer_connect/service/Apis.dart';
import 'package:customer_connect/service/server_request.dart';
import 'package:customer_connect/utills/res/enums.dart';
import 'package:flutter/cupertino.dart';

class AddPaymentHelper {

  static Future<dynamic> fetchCcavenuePaymentData({
    required BuildContext context,
    required String refId,
    required String schema,
    required PaymentRequest paymentRequest,
  }) async {
    
    try {
       String url = "${paymentRequest == PaymentRequest.bill ? Apis.billFullGeneration
           : Apis.payRegistrationIciciApi}"+"?ref_id=${refId}&schema=${schema}";
       var res = await ServerRequest.getData(urlEndPoint: url);
       if(res != null && res['success'] == 200 && res['data'] != null){
         return PaymentModel.fromJson(res['data']);
       }
    }catch(_){}
    return null;
  }

  static Future<dynamic> fetchRazorPaymentData({
    required BuildContext context,
    required String refId,
    required String schema,
    required PaymentRequest paymentRequest,
   }) async {

    try {
      String url = Apis.payRegistrationIciciApi+"?ref_id=${refId}&schema=${schema}";

    }catch(_){}
    return null;
  }

  static Future<dynamic> checkOrderConfirm({
    required BuildContext context,
    required String orderId,
    required String schema
    }) async {
    try {
      String url = Apis.getBillStatus+"?order_id=${orderId}&schema=${schema}";
      var res = await ServerRequest.getData(urlEndPoint: url);
      if(res != null && res['success'] == 200 && res['data'] != null){
        return PaymentStatusModel.fromJson(res['data']);
      }
    }catch(_){}
    return null;
  }

}