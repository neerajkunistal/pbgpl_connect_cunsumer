import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/complaint/addComplaint/domain/model/category_model.dart';
import 'package:customer_connect/features/complaint/addComplaint/domain/model/sub_category_model.dart';
import 'package:customer_connect/features/complaint/viewComplaint/domain/model/complaint_model.dart';
import 'package:customer_connect/features/dashboard/domain/model/file_model.dart';
import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/service/Apis.dart';
import 'package:customer_connect/service/server_request.dart';
import 'package:customer_connect/utills/Constants.dart';
import 'package:customer_connect/utills/commonClass/user_info.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_error_widget.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_success_widget.dart';
import 'package:flutter/cupertino.dart';

class AddComplaintHelper {
  static Future<dynamic> fetchCategoryData() async {
    try {
      LoginModel userData = UserInfo.instance!.userData!;
      String queryString = Uri(
              queryParameters: CategoryRequestModel(
        schema: userData.schema.toString(),
      ).toJson())
          .query;
      var url = Apis.getCategory + '?' + queryString;
      var res = await ServerRequest.getData(urlEndPoint: url);
      if (res != null && res['data'] != null) {
        return categoryListResponse(res['data']);
      }
    } catch (_) {}
    return null;
  }

  static Future<dynamic> fetchSubCategoryData(
      {required CategoryModel categoryData}) async {
    try {
      LoginModel userData = UserInfo.instance!.userData!;
      String queryString = Uri(
              queryParameters: SubCategoryRequestModel(
                      schema: userData.schema.toString(),
                      categoryId: categoryData.id.toString())
                  .toJson())
          .query;
      var url = Apis.getSubCategory + '?' + queryString;
      var res = await ServerRequest.getData(urlEndPoint: url);
      if (res != null && res['data'] != null) {
        return subCategoryListResponse(res['data']);
      }
    } catch (_) {}
    return null;
  }

  static Future<dynamic> textFiledValidationCheck({
    required BuildContext context,
    required CategoryModel categoryData,
    required SubCategoryModel subCategoryData,
    required String description,
  }) async {
    try {
      if (categoryData.id == null) {
        SnackBarErrorWidget(context).show(message: "Please select category");
        return false;
      } else if (subCategoryData.id == null) {
        SnackBarErrorWidget(context).show(message: "Please select subCategory");
        return false;
      } else if (description.isEmpty) {
        SnackBarErrorWidget(context).show(message: "Please enter description");
        return false;
      }
      return true;
    } catch (_) {}
    return false;
  }

  static Future<dynamic> submitData({
    required BuildContext context,
    required CategoryModel categoryData,
    required SubCategoryModel subCategoryData,
    required String description,
    required List<File> files,
  }) async {
    try {
      LoginModel userData = UserInfo.instance!.userData!;
      List<FileModel> fileList = [];
      for (var fileData in files) {
        fileList.add(FileModel(
            name: fileData.path.split('/').last,
            file: fileData,
            keyName: "attached_doc"));
      }
      var json = ComplaintSaveRequestModel(
        schema: userData.schema.toString(),
        dmaId: userData.dmaId.toString(),
        complainCat: categoryData.id != null ? categoryData.id.toString() : "",
        complainSubCat:
            subCategoryData.id != null ? subCategoryData.id.toString() : "",
        description: description.toString(),
        priority: "0",
      ).toJson();
      String url = Apis.complaintSave;
      var res = await ServerRequest.postDataWithFile(
          urlEndPoint: url, body: json, context: context, fileList: fileList);
      if(res != null && res['status'] != null && res['data'] != null){
        SnackBarSuccessWidget(context.mounted ? context : context).show(message: res['data'].toString());
        return res;
      }
    } catch (_) {}
    return null;
  }
}
