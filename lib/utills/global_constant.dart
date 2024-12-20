import 'package:flutter/cupertino.dart';

class GlobalConstants {
  bool isLoggedIn = false;
  static final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();
  static String isUserLogIn = "IsUserLogIn";
  static String username = "username";
  static String password = "password";
  static String token = "token";
  static String id = "id";
  static String name = "name";
  static String role = "role";
  static String email = "email";
  static String schema = "schema";
  static String bpNumber = "bpNumber";
  static String payNow = "payNow";
  static String pdf = "pdf";
  static String lmcId = "lmcId";
  static String dmaId = "dmaId";
  static String perScmAmt = "perScmAmt";
  static String billFetchRef = "billFetchRef";
  static String billNo = "billNo";
  static String totalAmount = "totalAmount";
  static String loginFirst = "Please Login First";
  static String mobileNumber = "mobile_number";
  static String address = "address";
  static String town = "town";
  static String city = "city";
  static String district = "district";
  static String states = "states";
  static String crn = "crn";
  static String locality = "locality";
  static String pinCode = "pincode";
  static String meterSerialNumber = "meterSerialNumber";
}
