class PayBillResponse {
  int? status;
  Data? data;
  bool? error;

  PayBillResponse({this.status, this.data, this.error});

  PayBillResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['error'] = this.error;
    return data;
  }
}

class Data {
  int? code;
  String? rrnNumber;
  String? transaction_status;
  String? transactionReferenceNumber;
  String? billNo;
  String? transactionTimestamp;

  Data(
      {this.code,
      this.rrnNumber,
      this.transaction_status,
      this.transactionReferenceNumber,
      this.billNo,
      this.transactionTimestamp});

  Data.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    rrnNumber = json['rrn_number'];
    transaction_status = json['transaction_status'];
    transactionReferenceNumber = json['transaction_reference_number'];
    billNo = json['bill_no'];
    transactionTimestamp = json['transaction_timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['rrn_number'] = this.rrnNumber;
    data['transaction_status'] = this.transaction_status;
    data['transaction_reference_number'] = this.transactionReferenceNumber;
    data['bill_no'] = this.billNo;
    data['transaction_timestamp'] = this.transactionTimestamp;
    return data;
  }
}
