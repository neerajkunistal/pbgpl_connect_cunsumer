class BillAmountModel {
  dynamic lateFee;
  dynamic totalAmount;
  dynamic billPayDate;
  dynamic billStatus;

  BillAmountModel({this.billPayDate,
    this.lateFee,
    this.totalAmount,
    this.billStatus,
  });

  factory BillAmountModel.fromJson(Map<String, dynamic> json) {
    return BillAmountModel(
      lateFee: json['late_fee'] ?? "",
      totalAmount: json['total_amt'] ?? "",
      billPayDate: json['bill_pay_date'] ?? "",
      billStatus: json['bill_status'] ?? "",
    );
  }
}