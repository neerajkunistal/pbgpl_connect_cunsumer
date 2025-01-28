import 'package:customer_connect/features/payment/addPayment/domain/model/payment_model.dart';
import 'package:customer_connect/features/payment/addPayment/domain/model/payment_status_model.dart';
import 'package:customer_connect/service/Apis.dart';
import 'package:customer_connect/service/server_request.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_error_widget.dart';
import 'package:customer_connect/utills/res/enums.dart';
import 'package:flutter/cupertino.dart';

class AddPaymentHelper {

  static Future<bool> partialAmountValidation
      ({required BuildContext context,
       required bool isPartialPayment,
       required String partialAmount,
       required String fullAmount,
       required String minAmount,
      }) async {
    try {
       if (isPartialPayment == false){
         return true;
       }
       else if(partialAmount.isEmpty && isPartialPayment == true){
         SnackBarErrorWidget(context).show(message: "Please enter amount");
         return false;
       }

       double _partialAmount =  double.parse(partialAmount);
       double _fullAmount =  double.parse(fullAmount);
       double _minAmount =  double.parse(minAmount.isEmpty ? "1" : minAmount);
       if(_partialAmount < _minAmount && isPartialPayment == true){
         SnackBarErrorWidget(context).show(message: "Please enter minimum amount");
         return false;
       }
       if(_fullAmount < _partialAmount){
         SnackBarErrorWidget(context).show(message: "Please enter valid amount");
         return false;
       }
       return true;
    }catch(_){};
    return true;
  }

  static Future<dynamic> fetchPartialAmountData({
    required BuildContext context,
    required String refId,
    required String schema,
    required PaymentRequest paymentRequest,
  }) async {

    try {

    }catch(_){}
    return null;
  }

  static Future<dynamic> fetchCcavenuePaymentData({
    required BuildContext context,
    required String refId,
    required String schema,
    required PaymentRequest paymentRequest,
    required String partialPaymentType,
    required String amount,
  }) async {
    
    try {
       String url = "${paymentRequest == PaymentRequest.bill ? Apis.billFullGeneration
           : Apis.payRegistrationIciciApi}"+"?ref_id=${refId}&schema=${schema}&amount=${amount}&type=${partialPaymentType}";
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
    required String partialPaymentType,
    required String amount,
   }) async {

    try {
      String url = Apis.payRegistrationRazorpayApi+"?ref_id=${refId}&schema=${schema}&amount=${amount}&type=${partialPaymentType}";
      var res = await ServerRequest.getData(urlEndPoint: url);
      if(res != null && res['success'] == 200 && res['data'] != null){
        return PaymentModel.fromJson(res['data']);
      }

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

  static Future<dynamic> checkResOrderConfirm({
    required BuildContext context,
    required String orderId,
    required String schema
  }) async {
    try {
      String url = Apis.getRegBillStatusApi+"?order_id=${orderId}&schema=${schema}";
      var res = await ServerRequest.getData(urlEndPoint: url);
      if(res != null && res['success'] == 200 && res['data'] != null){
        return PaymentStatusModel.fromJson(res['data']);
      }
    }catch(_){}
    return null;
  }

  static Future<dynamic> checkResOrderConfirmRazorPay({
    required BuildContext context,
    required PaymentModel paymentData,
  }) async {
    try {
      String url = Apis.getResponseRazorpayApi;
      var json = {
        "razorpay_payment_id" : paymentData.paymentId.toString(),
        "razorpay_order_id" : paymentData.paymentOrderId.toString(),
        "razorpay_signature" : paymentData.signature.toString(),
      };
      var res = await ServerRequest.postDataWithFile(urlEndPoint: url, body: json, context: context);
      if(res != null && res['status'] == 200 && res['data'] != null){
        var data =  res['data'];
        var orderStatus  =  data['order_status'] ?? "";
        var amount  =  data['amount'] ?? "";
        var transaction_id  =  data['transaction_id'] ?? "";
        var paymentMethod  =  data['payment_method'] ?? "";
        PaymentStatusModel paymentStatusData =  PaymentStatusModel(
          transactionStatus: orderStatus.toString().toLowerCase() == "captured" ? "1" : "0",
          amount: amount.toString(),
          paymentMode: paymentMethod.toString(),
          orderId: transaction_id.toString(),
        );
        return paymentStatusData;
      }
    }catch(_){}
    return null;
  }

}