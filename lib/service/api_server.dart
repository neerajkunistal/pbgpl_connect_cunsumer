import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../features/login/domain/model/login_model.dart';
import '../models/bp_number_model.dart';
import '../models/complain_history_model.dart';
import '../models/complaint_save_model.dart';
import '../models/generate_model.dart';
import '../models/get_category_model.dart';
import '../models/get_sub_category_model.dart';
import '../models/pending_bill_model.dart';
import '../utills/common_widget/custom_toast.dart';
import '../utills/global_constant.dart';
import 'Apis.dart';

class ApiIntegration {
  static Future<dynamic> getData(
      {required String endPoint, required BuildContext context}) async {
    final res = await http.get(Uri.parse(endPoint));
    try {
      if (res.statusCode == 200) {
        return json.decode(res.body);
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  static Future<dynamic> postData(
      {required String endPoint,
      var body,
      required BuildContext context}) async {
    var res = await http.post(Uri.parse(endPoint), body: body);
    try {
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      }
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //For Login
  Future<LoginModel?> login(LoginRequestModel loginRequestModel) async {
    final jsonString = json.encode(loginRequestModel);
    final response = await http.post(Uri.parse(Apis.login), body: jsonString);
    print("Login--->" + (Apis.login));
    print("Login--->" + response.body);
    try {
      if (response.statusCode == 200) {
        return LoginModel.fromJson(
          json.decode(response.body),
        );
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data!');
    }
    return null;
  }

  //For getPendingBillsMeterReader
  Future bpNumberSearch(BPNumberRequestModel bpNumberRequestModel) async {
    String queryString =
        Uri(queryParameters: bpNumberRequestModel.toJson()).query;
    var billsMeterReaderUrl =
        Apis.getPendingBillsMeterReader + '?' + queryString;
    print("getPendingBillsMeterReader-->" + billsMeterReaderUrl);
    var response = await http.get(Uri.parse(billsMeterReaderUrl));
    print("getPendingBillsMeterReader--->" + response.body);
    print("statusCode-->");
    print(response.statusCode);
    if (response.statusCode == 200) {
      BpNumberModel resp =
          BpNumberModel.fromJson(jsonDecode(response.body.toString()));
      print("200-->" + resp.data.toString());
      return resp.data;
    } else if (response.statusCode == 500) {
      BpNumberModel resp =
          BpNumberModel.fromJson(jsonDecode(response.body.toString()));
      print("500-->" + resp.data.toString());
      CustomToast.showToast(resp.data.toString());
      return null;
    } else if (response.statusCode == 400) {
      BpNumberModel resp =
          BpNumberModel.fromJson(jsonDecode(response.body.toString()));
      print("400-->" + resp.data.toString());
      CustomToast.showToast(resp.data.toString());
      return resp.data;
    } else {
      BpNumberModel resp =
          BpNumberModel.fromJson(jsonDecode(response.body.toString()));
      //  CustomToast.showToast(resp.data.toString());
      return resp.data;
    }
  }

  Future<GenerateModel> submitgenerateApi(
      GenerateRequestModel generateRequestModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(GlobalConstants.token) ?? "";
    var request = await http.MultipartRequest("Post", Uri.parse(Apis.generate));

    Map<String, String> requestBody = <String, String>{
      "schema": generateRequestModel.schema!,
      "bpNumber": generateRequestModel.bpNumber!,
      "meter_reading": generateRequestModel.meter_reading!,
      "meter_serial": generateRequestModel.meter_serial!,
      "generate_by_customer": generateRequestModel.generate_by_customer!,
      "latitude": generateRequestModel.latitude!,
      "longitude": generateRequestModel.longitude!,
      "old_reading": generateRequestModel.old_reading!,
    };
    request.headers["authorization"] = token;
    request.fields.addAll(requestBody);
    if (!(generateRequestModel.meter_image_file == null ||
        generateRequestModel.meter_image_file == " ")) {
      var meterImage = await http.MultipartFile.fromPath(
          "meter_image_file", generateRequestModel.meter_image_file!);
      request.files.add(meterImage);
    }
    print("Request" + requestBody.toString());
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print("Response-->" +
        response.toString() +
        "responseString :" +
        responseString);
    {
      if (response.statusCode == 200) {
        return GenerateModel.fromJson(json.decode(responseString));
      } else if (response.statusCode == 400) {
        GenerateModel res = GenerateModel.fromJson(json.decode(responseString));
        print("400-->" + res.toString());
        return res;
      } else if (response.statusCode == 404) {
        GenerateModel res = GenerateModel.fromJson(json.decode(responseString));
        print("404-->" + res.toString());
        return res;
      } else if (response.statusCode == 500) {
        GenerateModel res = GenerateModel.fromJson(json.decode(responseString));
        print("500-->" + res.toString());
        return res;
      } else {
        throw Exception('Failed to load data!');
      }
    }
  }

//For getPendingBills
  Future<PendingBillData?> apiPengingBill(
      PendingBillRequestModel pendingBillRequestModel) async {
    String queryString =
        Uri(queryParameters: pendingBillRequestModel.toJson()).query;
    var getPendingBillsUrl = Apis.getPendingBills + '?' + queryString;

    var response = await http.get(Uri.parse(getPendingBillsUrl));
    print("getPendingBills--->" + response.body);
    try {
      if (response.statusCode == 200) {
        PendingBillsModel resp =
            PendingBillsModel.fromJson(jsonDecode(response.body.toString()));
        return resp.data;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  //For getPendingBills
  Future<List<Data>?> apiComplaints(
      ComplainHistoryRequestModel complainHistoryRequestModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(GlobalConstants.token);
    String queryString =
        Uri(queryParameters: complainHistoryRequestModel.toJson()).query;
    var getPendingBillsUrl = Apis.complaints + '?' + queryString;

    var response = await http.get(Uri.parse(getPendingBillsUrl), headers: {
      'Authorization': token!,
    });
    print("complaints--->" + response.body);
    try {
      if (response.statusCode == 200) {
        ComplainHistoryModel resp =
            ComplainHistoryModel.fromJson(jsonDecode(response.body.toString()));
        return resp.data;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

//For getCategory
  Future<GetCategoryModel?> apiGetCategory(
      GetCategoryRequestModel getCategoryRequestModel) async {
    String queryString =
        Uri(queryParameters: getCategoryRequestModel.toJson()).query;
    var getCategoryUrl = Apis.getCategory + '?' + queryString;
    var response = await http.get(Uri.parse(getCategoryUrl));
    print("getCategory--->" + response.body);
    try {
      if (response.statusCode == 200) {
        GetCategoryModel resp =
            GetCategoryModel.fromJson(jsonDecode(response.body.toString()));
        return resp;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  //For getSubCategory
  Future<GetSubCategoryModel?> apiGetSubCategory(
      GetSubCategoryRequestModel getSubCategoryRequestModel) async {
    String queryString =
        Uri(queryParameters: getSubCategoryRequestModel.toJson()).query;
    var getCategoryUrl = Apis.getSubCategory + '?' + queryString;
    var response = await http.get(Uri.parse(getCategoryUrl));
    print("getCategory--->" + response.body);
    try {
      if (response.statusCode == 200) {
        GetSubCategoryModel resp =
            GetSubCategoryModel.fromJson(jsonDecode(response.body.toString()));
        return resp;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<ComplaintSaveModel> apiComplaintSave(
      ComplaintSaveRequestModel complaintSaveRequestModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(GlobalConstants.token) ?? "";
    var request =
        await http.MultipartRequest("Post", Uri.parse(Apis.complaintSave));
    Map<String, String> requestBody = <String, String>{
      "schema": complaintSaveRequestModel.schema!,
      "dma_id": complaintSaveRequestModel.dmaId!,
      "complain_cat": complaintSaveRequestModel.complainCat!,
      "complain_subcat": complaintSaveRequestModel.complainSubCat!,
      "description": complaintSaveRequestModel.description!,
      "priority": complaintSaveRequestModel.priority!,
    };
    request.headers["authorization"] = token;
    request.fields.addAll(requestBody);
    if (complaintSaveRequestModel.attachedDoc!.isNotEmpty) {
      var attachDoc = await http.MultipartFile.fromPath(
          "attached_doc", complaintSaveRequestModel.attachedDoc!);
      request.files.add(attachDoc);
    } else {
      request.fields["attached_doc"] = "";
    }
    print("Request" + requestBody.toString());
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print("Response-->" +
        response.toString() +
        "responseString :" +
        responseString);
    {
      if (response.statusCode == 200) {
        return ComplaintSaveModel.fromJson(json.decode(responseString));
      } else {
        throw Exception('Failed to load data!');
      }
    }
  }
}

enum Status { error }
