// Class for api tags
class Apis {
//  static String baseUrl = 'http://142.79.231.30:8084/api/customer';
  static String baseUrl = 'http://142.79.231.30:9097/api/customer';

   // static String baseUrl = 'https://pbgpl.smartgasnet.com/api/customer';
  static String users = '/getindustry';
  static String register = '/register';
  static String loginOtp = '/login-otp';
  static String login =  '/login';
  static String tablelist = baseUrl + 'getlmcInstallationbyNgc';
  static String generate = baseUrl + '/meter-reading/generate';
  static String list = 'getlmcInstallationbyNgc';
  static String arealist = baseUrl + "/getAllArea?schema=";

  static String getCategory =  "/get-category";
  static String getSubCategory =  "/get-sub-category";
  static String complaintSave =   "/complaint-save";

  static String getPendingBills = "/getPendingBills";
  static String complaints = baseUrl + "/complaints";
  static String getAllBills = baseUrl + "/getAllBills?";
  static String pay_bill = baseUrl + "/pay-bill";
  static String generateallbills = baseUrl + "/getRequestedBills?";
  static String getRequestedBills = baseUrl;
  static String otp = '/otp-verify';
  static String getcategory = '/get-category?schema=mvv';
  static String getPendingBillsMeterReader =
      baseUrl + '/getPendingBillsMeterReader';
}
