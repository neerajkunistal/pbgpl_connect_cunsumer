// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class LoginModel {
  final int status;
  final bool error;
  final String messages;
  final String token;
  final User user;
  final String exptime;

  LoginModel({
    required this.status,
    required this.error,
    required this.messages,
    required this.token,
    required this.user,
    required this.exptime,
  });

  factory LoginModel.fromRawJson(String str) => LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    error: json["error"],
    messages: json["messages"],
    token: json["token"],
    user: User.fromJson(json["user"]),
    exptime: json["exptime"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "error": error,
    "messages": messages,
    "token": token,
    "user": user.toJson(),
    "exptime": exptime,
  };
}

class User {
  final String id;
  final String bpNumber;
  final String serialNumber;
  final String dmaId;
  final String name;
  final String schema;
  final String crn;
  final String mobileNumber;
  final String email;
  final DateTime dateOfRegistration;
  final String address;
  final String area;
  final String locality;
  final String town;
  final String pincode;
  final dynamic district;
  final dynamic states;

  User({
    required this.id,
    required this.bpNumber,
    required this.serialNumber,
    required this.dmaId,
    required this.name,
    required this.schema,
    required this.crn,
    required this.mobileNumber,
    required this.email,
    required this.dateOfRegistration,
    required this.address,
    required this.area,
    required this.locality,
    required this.town,
    required this.pincode,
    required this.district,
    required this.states,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] ?? " ",
    bpNumber: json["bp_number"] ?? " ",
    serialNumber: json["serial_number"] ?? " ",
    dmaId: json["dma_id"] ?? " ",
    name: json["name"] ?? " ",
    schema: json["schema"] ?? " ",
    crn: json["crn"] ?? " ",
    mobileNumber: json["mobile_number"] ?? " ",
    email: json["email"] ?? " ",
    dateOfRegistration: DateTime.parse(json["date_of_registration"]),
    address: json["address"] ?? " ",
    area: json["area"] ?? " ",
    locality: json["locality"] ?? " ",
    town: json["town"] ?? " ",
    pincode: json["pincode"] ?? " ",
    district: json["district"] ?? "",
    states: json["states"] ?? " ",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bp_number": bpNumber,
    "serial_number": serialNumber,
    "dma_id": dmaId,
    "name": name,
    "schema": schema,
    "crn": crn,
    "mobile_number": mobileNumber,
    "email": email,
    "date_of_registration": "${dateOfRegistration.year.toString().padLeft(4, '0')}-${dateOfRegistration.month.toString().padLeft(2, '0')}-${dateOfRegistration.day.toString().padLeft(2, '0')}",
    "address": address,
    "area": area,
    "locality": locality,
    "town": town,
    "pincode": pincode,
    "district": district,
    "states": states,
  };
}



class LoginRequestModel{
  final String bpNumber;
  final String password;
  LoginRequestModel({ required this.bpNumber, required this.password});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "bp_number": bpNumber.trim().toString(),
      "password": password.trim().toString(),
    };
    return map ;
  }
}