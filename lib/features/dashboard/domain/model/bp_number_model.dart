import 'package:customer_connect/features/dashboard/domain/model/bill_amount_model.dart';
import 'package:customer_connect/features/dashboard/domain/model/customer_model.dart';
import 'package:customer_connect/features/dashboard/domain/model/instal_lmc_model.dart';
import 'package:customer_connect/features/dashboard/domain/model/ngc_model.dart';
import 'package:customer_connect/features/dashboard/domain/model/transaction_model.dart';
import 'package:customer_connect/features/payment/paymentHistory/domain/model/payment_history_model.dart';

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
  dynamic mobileChangeStatus;

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
      this.mobileChangeStatus,
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
      customerData: json['dmaData'] != null ? CustomerModel.fromJson(json['dmaData']) : CustomerModel(),
      installLmcData: json['instal_lmcdata'] != null ? InstallLmcModel.fromJson(json['instal_lmcdata']) : InstallLmcModel(),
      ngcData: json['ngc_data'] != null ? NgcModel.fromJson(json['ngc_data']) : NgcModel(),
      transactionList: json['bill_data'] != null ? transactionListResponse(json['bill_data']) :[],
      paymentHistoryList: json['payment_history'] != null ? paymentHistoryListResponse(json['payment_history']) : [],
    );
  }

}
