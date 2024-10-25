// To parse this JSON data, do
//
//     final pendingBillsModel = pendingBillsModelFromJson(jsonString);

import 'dart:convert';

PendingBillsModel pendingBillsModelFromJson(String str) => PendingBillsModel.fromJson(json.decode(str));

String pendingBillsModelToJson(PendingBillsModel data) => json.encode(data.toJson());

class PendingBillsModel {
  PendingBillsModel({
    required this.success,
    required this.code,
    required this.error,
    this.data,
  });

  bool success;
  int code;
  bool error;
  PendingBillData? data;

  factory PendingBillsModel.fromJson(Map<String, dynamic> json) => PendingBillsModel(
    success: json["success"],
    code: json["code"],
    error: json["error"],
    data: PendingBillData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "error": error,
    "data": data!.toJson(),
  };
}

class PendingBillData {
  PendingBillData({
    required  this.cycle,
    required  this.billNo,
    required  this.amount,
    required  this.billDueDate,
    required  this.billGeneratedDate,
    required  this.houseNumber,
    required  this.locality,
    required  this.town,
    required  this.pinCode,
    required  this.address,
    required  this.crn,
    required  this.meterSerialNumber,
    required  this.oldReading,
    required  this.currentBillReading,
    required  this.perScmAmt,
    required  this.bpNumber,
    required  this.firstName,
    required  this.middleName,
    required   this.lastName,
    required     this.billFetchRef,
    required  this.lateFee,
    required   this.fetchReferenceNumber,
    required   this.payNow,
    required   this.pdf,
  });

  Cycle cycle;
  String billNo;
  String amount;
  DateTime billDueDate;
  DateTime billGeneratedDate;
  String houseNumber;
  String locality;
  String town;
  String pinCode;
  String address;
  String crn;
  String meterSerialNumber;
  String oldReading;
  String currentBillReading;
  String perScmAmt;
  String bpNumber;
  String firstName;
  String middleName;
  String lastName;
  String billFetchRef;
  int lateFee;
  String fetchReferenceNumber;
  String payNow;
  String pdf;

  factory PendingBillData.fromJson(Map<String, dynamic> json) => PendingBillData(
    cycle: Cycle.fromJson(json["cycle"]) ,
    billNo: json["bill_no"] ?? " ",
    amount: json["amount"] ?? " ",
    billDueDate: DateTime.parse(json["bill_due_date"]),
    billGeneratedDate: DateTime.parse(json["bill_generated_date"]),
    houseNumber: json["house_number"] ?? " ",
    locality: json["locality"] ?? " ",
    town: json["town"] ?? " ",
    pinCode: json["pin_code"] ?? " ",
    address: json["address"] ?? " ",
    crn: json["crn"] ?? " ",
    meterSerialNumber: json["meter_serial_number"] ?? " ",
    oldReading: json["old_reading"] ?? " ",
    currentBillReading: json["current_bill_reading"] ?? " ",
    perScmAmt: json["per_scm_amt"] ?? " ",
    bpNumber: json["bp_number"] ?? " ",
    firstName: json["first_name"] ?? " ",
    middleName: json["middle_name"] ?? " ",
    lastName: json["last_name"] ?? " ",
    billFetchRef: json["bill_fetch_ref"] ?? " ",
    lateFee: json["late_fee"] ?? " ",
    fetchReferenceNumber: json["fetchReferenceNumber"] ?? " ",
    payNow: json["payNow"] ?? " ",
    pdf: json["pdf"] ?? " ",
  );

  Map<String, dynamic> toJson() => {
    "cycle": cycle.toJson(),
    "bill_no": billNo,
    "amount": amount,
    "bill_due_date": billDueDate.toIso8601String(),
    "bill_generated_date": billGeneratedDate.toIso8601String(),
    "house_number": houseNumber,
    "locality": locality,
    "town": town,
    "pin_code": pinCode,
    "address": address,
    "crn": crn,
    "meter_serial_number": meterSerialNumber,
    "old_reading": oldReading,
    "current_bill_reading": currentBillReading,
    "per_scm_amt": perScmAmt,
    "bp_number": bpNumber,
    "first_name": firstName,
    "middle_name": middleName,
    "last_name": lastName,
    "bill_fetch_ref": billFetchRef,
    "late_fee": lateFee,
    "fetchReferenceNumber": fetchReferenceNumber,
    "payNow": payNow,
    "pdf": pdf,
  };
}

class Cycle {
  Cycle({
    required this.period,
    required  this.interval,
    required   this.fromDate,
    required  this.toDate,
    required   this.pricePerUnit,
    required   this.grand,
  });

  String period;
  int interval;
  DateTime fromDate;
  DateTime toDate;
  String pricePerUnit;
  String grand;

  factory Cycle.fromJson(Map<String, dynamic> json) => Cycle(
    period: json["period"],
    interval: json["interval"],
    fromDate: DateTime.parse(json["from_date"]),
    toDate: DateTime.parse(json["to_date"]),
    pricePerUnit: json["pricePerUnit"],
    grand: json["grand"],
  );

  Map<String, dynamic> toJson() => {
    "period": period,
    "interval": interval,
    "from_date": fromDate.toIso8601String(),
    "to_date": toDate.toIso8601String(),
    "pricePerUnit": pricePerUnit,
    "grand": grand,
  };
}


class PendingBillRequestModel{
  final String schema;
  final String bpNumber;
  final String payNow;
  PendingBillRequestModel({ required this.schema, required this.bpNumber, required this.payNow});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "schema": schema.toString().trim(),
      "bpNumber": bpNumber.toString().trim(),
      "pay_now": payNow.toString().trim(),
    };
    return map ;
  }
}
