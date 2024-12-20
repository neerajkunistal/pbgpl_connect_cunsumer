class PaymentModel {
  String? url;
  String? encValue;
  String? accessCode;
  dynamic orderId;

  PaymentModel({this.url, this.accessCode, this.encValue, this.orderId});

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      url: json['url'] ?? "",
      orderId: json['order_id'] ?? "",
      encValue: json['enc_val'] ?? "",
      accessCode: json['access_code'] ?? "",
    );
  }
}