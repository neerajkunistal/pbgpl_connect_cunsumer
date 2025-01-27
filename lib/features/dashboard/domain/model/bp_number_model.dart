import 'package:customer_connect/features/dashboard/domain/model/bill_amount_model.dart';
import 'package:customer_connect/features/dashboard/domain/model/customer_model.dart';
import 'package:customer_connect/features/dashboard/domain/model/instal_lmc_model.dart';
import 'package:customer_connect/features/dashboard/domain/model/ngc_model.dart';
import 'package:customer_connect/features/dashboard/domain/model/transaction_model.dart';
import 'package:customer_connect/features/payment/paymentHistory/domain/model/payment_history_model.dart';
import 'package:customer_connect/utills/res/enums.dart';

class BPNumberModel {
  CustomerModel? customerData;
  BillAmountModel? billAmountData;
  List<TransactionModel>? transactionList;
  dynamic billOnTime;
  dynamic billLate;
  dynamic totalAmount;
  dynamic refId;
  dynamic axisCategoriesString;
  dynamic consumptionString;
  dynamic amountString;
  InstallLmcModel? installLmcData;
  NgcModel? ngcData;
  List<PaymentHistoryModel>? paymentHistoryList;
  List<PaymentHistoryModel>? regPaymentHistoryList;
  dynamic mobileChangeStatus;
  dynamic paymentType;
  dynamic paymentTypeHeading;
  dynamic message;
  dynamic consentUrl;
  dynamic gateway;
  PaymentGateway paymentGateway;
  PaymentRequest paymentRequest;

  BPNumberModel(
      {this.totalAmount,
      this.amountString,
      this.refId,
      this.axisCategoriesString,
      this.billAmountData,
      this.billLate,
      this.billOnTime,
      this.consumptionString,
      this.customerData,
      this.installLmcData,
      this.ngcData,
      this.transactionList,
      this.paymentHistoryList,
      this.regPaymentHistoryList,
      this.mobileChangeStatus,
      this.paymentType,
      this.paymentTypeHeading,
      this.message,
      this.consentUrl,
      this.gateway,
      this.paymentGateway =  PaymentGateway.ccavenue,
      this.paymentRequest =  PaymentRequest.bill
      });


  factory BPNumberModel.fromJson(Map<String, dynamic> json) {
    return BPNumberModel(
      totalAmount:  json['total_amt'] ?? "",
      amountString: json['amountString'] ?? "",
      refId: json['ref_id'] ?? "",
      axisCategoriesString: json['xAxisCategoriesString'] ?? "",
      billAmountData: json['bill_amt'] != null ? BillAmountModel.fromJson(json['bill_amt']) : BillAmountModel(),
      billLate: json['bill_late'] ?? "",
      billOnTime: json['bill_ontime'] ?? "",
      consumptionString: json['consumptionString'] ?? "",
      mobileChangeStatus: json['mobile_change_status'] ?? "",
      paymentType: json['payment_type'] ?? "",
      paymentTypeHeading: json['payment_type_heading'] ?? "",
      message: json['message'] ?? "",
      consentUrl: json['consentUrl'] ?? "",
      gateway: json['gateway'] ?? "",
      paymentGateway: getPaymentGateway(json['gateway'] ?? ""),
      paymentRequest: getPaymentRequest(json['payment_type'] ?? ""),
      customerData: json['dmaData'] != null ? CustomerModel.fromJson(json['dmaData']) : CustomerModel(),
      installLmcData: json['instal_lmcdata'] != null ? InstallLmcModel.fromJson(json['instal_lmcdata']) : InstallLmcModel(),
      ngcData: json['ngc_data'] != null ? NgcModel.fromJson(json['ngc_data']) : NgcModel(),
      transactionList: json['bill_data'] != null ? transactionListResponse(json['bill_data']) :[],
      paymentHistoryList: json['payment_history'] != null ? paymentHistoryListResponse(json['payment_history']) : [],
      regPaymentHistoryList: json['reg_payment_history'] != null ? paymentHistoryListResponse(json['reg_payment_history']) : [],
    );
  }

  static PaymentGateway getPaymentGateway(String gateway) {
    switch(gateway){
      case "ccavenue" :
        return PaymentGateway.ccavenue;
      case "razorpay" :
        return PaymentGateway.razorPay;
      default :
        return PaymentGateway.ccavenue;
    }
  }

  static PaymentRequest getPaymentRequest(String gateway) {
    switch(gateway){
      case "registration" :
        return PaymentRequest.newConnection;
      case "billing" :
        return PaymentRequest.bill;
      default :
        return PaymentRequest.bill;
    }
  }


}
