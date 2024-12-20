List<PaymentStatusModel> paymentStatusListResponse(var json) {
  return List<PaymentStatusModel>.from(json.map((x) => PaymentStatusModel.fromJson(x)));
}

class PaymentStatusModel {
  String? id;
  String? billId;
  String? fetchReferenceNumber;
  String? amount;
  String? paidAmount;
  String? transactionStatus;
  String? createdAt;
  String? updatedAt;
  String? rrnNumber;
  String? paymentMode;
  String? transactionReferenceNumber;
  String? returnTransId;
  String? bankRefNo;
  String? cardName;
  String? orderId;
  String? netbankingCharge;
  String? paymentType;

  PaymentStatusModel(
      {this.id,
        this.billId,
        this.fetchReferenceNumber,
        this.amount,
        this.paidAmount,
        this.transactionStatus,
        this.createdAt,
        this.updatedAt,
        this.rrnNumber,
        this.paymentMode,
        this.transactionReferenceNumber,
        this.returnTransId,
        this.bankRefNo,
        this.cardName,
        this.orderId,
        this.netbankingCharge,
        this.paymentType});

  PaymentStatusModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    billId = json['bill_id'] ?? "";
    fetchReferenceNumber = json['fetch_reference_number'] ?? "";
    amount = json['amount'] ?? "";
    paidAmount = json['paid_amount'] ?? "";
    transactionStatus = json['transaction_status'] ?? "";
    createdAt = json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? "";
    rrnNumber = json['rrn_number'] ?? "";
    paymentMode = json['payment_mode'] ?? "";
    transactionReferenceNumber = json['transaction_reference_number'] ?? "";
    returnTransId = json['return_trans_id'] ?? "";
    bankRefNo = json['bank_ref_no'] ?? "";
    cardName = json['card_name'] ?? "";
    orderId = json['order_id'] ?? "";
    netbankingCharge = json['netbanking_charge'] ?? "";
    paymentType = json['payment_type'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bill_id'] = this.billId;
    data['fetch_reference_number'] = this.fetchReferenceNumber;
    data['amount'] = this.amount;
    data['paid_amount'] = this.paidAmount;
    data['transaction_status'] = this.transactionStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['rrn_number'] = this.rrnNumber;
    data['payment_mode'] = this.paymentMode;
    data['transaction_reference_number'] = this.transactionReferenceNumber;
    data['return_trans_id'] = this.returnTransId;
    data['bank_ref_no'] = this.bankRefNo;
    data['card_name'] = this.cardName;
    data['order_id'] = this.orderId;
    data['netbanking_charge'] = this.netbankingCharge;
    data['payment_type'] = this.paymentType;
    return data;
  }
}