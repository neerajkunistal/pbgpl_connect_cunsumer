// Class for api tags
import 'package:customer_connect/utills/commonClass/singleton.dart';
import 'package:customer_connect/utills/res/environment_config.dart';
import 'package:flutter/material.dart';

class Apis {


  static BuildContext? context = Singleton.instance.context;

  static final String baseUrl =
      EnvironmentConfig.of(context!)!.generalUrlBaseOnFlavour;

   // static String baseUrl = 'https://pbgpl.smartgasnet.com/api/customer';
  static String users = 'api/customer/getindustry';
  static String register = 'api/customer/register';
  static String loginOtp = 'api/customer/login-otp';
  static String login =  'api/customer/login';
  static String tablelist =  'api/customer/getlmcInstallationbyNgc';
  static String generate =  'api/customer/meter-reading/generate';
  static String list = 'getlmcInstallationbyNgc';
  static String arealist = baseUrl + "/getAllArea?schema=";

  static String getCategory =  "api/customer/get-category";
  static String getSubCategory =  "api/customer/get-sub-category";
  static String complaintSave =   "api/customer/complaint-save";

  static String getPendingBills = "/getPendingBills";
  static String complaints = "api/customer/complaints";
  static String getAllBills = baseUrl + "/getAllBills?";
  static String pay_bill = baseUrl + "/pay-bill";
  static String generateallbills = baseUrl + "/getRequestedBills?";
  static String getRequestedBills = baseUrl;
  static String otp = '/otp-verify';
  static String getcategory = '/get-category?schema=mvv';
  static String getPendingBillsMeterReader =
      baseUrl + '/getPendingBillsMeterReader';

  static String changePassword = "api/customer/changePassword";

  static String forgotPassword = "api/customer/forgotPassword";

  static String resetPassword = "api/customer/resetPassword";

  static String updateMobileNumber = "api/customer/updateMobileNumber";

  static String getCustomer360Details = "api/getCustomer360Details";

  static String getBillStatus = "customer/getBillStatus";

  static String billFullGeneration = "api/customer-qr-FullGeneration";

  static String getMeterNumber = "api/customer/getMeterNumber";

  static String getMeterReading = "api/customer/getCustomerPrevSelfBillingData";

  static String saveSelfBillingApi = "api/customer/saveCustomerSelfBillingData";

  static String getSelfBillingApi = "api/customer/getSelfBillingRequestHistory";
}
