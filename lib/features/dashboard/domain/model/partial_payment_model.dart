class PartialPaymentModel {

  LastPartialPaymentDetail? lastPartialPaymentDetail;
  dynamic minPayAmount;

  PartialPaymentModel({this.lastPartialPaymentDetail, this.minPayAmount});

  factory PartialPaymentModel.fromJson(Map<String, dynamic> json) {
    return PartialPaymentModel(
      minPayAmount: json['min_pay_amount'] ?? "0",
      lastPartialPaymentDetail: json['lastPartialPaidAmount'] != null
          ? LastPartialPaymentDetail.fromJson(json['lastPartialPaidAmount'])
          : null,
    );
  }

}

class LastPartialPaymentDetail {

  dynamic totalPartialPaid;
  dynamic lastPaidDate;

  LastPartialPaymentDetail({
   this.lastPaidDate,
   this.totalPartialPaid,
});

  factory LastPartialPaymentDetail.fromJson(Map<String, dynamic> json) {
    return LastPartialPaymentDetail(
      lastPaidDate: json['last_pay_date'] ?? "0",
      totalPartialPaid: json['total_partial_paid'] ?? "0",
    );
  }
}