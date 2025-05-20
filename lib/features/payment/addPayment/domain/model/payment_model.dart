class PaymentModel {
  String? url;
  dynamic encValue;
  String? accessCode;
  dynamic orderId;
  dynamic paymentId;
  dynamic signature;
  dynamic paymentOrderId;
  dynamic message;

  PaymentModel({this.url,
    this.accessCode,
    this.encValue,
    this.orderId,
    this.signature,
    this.paymentId,
    this.paymentOrderId,
    this.message,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      url: json['url'] ?? "",
      orderId: json['order_id'] ?? "",
      encValue: json['enc_val'] ?? "",
      accessCode: json['access_code'] ?? "",
      message: json['message'] ?? "",
    );
  }
}