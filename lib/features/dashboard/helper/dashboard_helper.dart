import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/model/bp_number_model.dart';
import 'package:customer_connect/service/Apis.dart';
import 'package:customer_connect/service/server_request.dart';
import 'package:customer_connect/utills/LoaderDialog.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_error_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class DashboardHelper {

  static Future<dynamic> checkCustomerRegistrationData({
    required String schema,
    required String bpNumber,
    required BuildContext context,
  }) async {
    try {
      String url = Apis.getCustomerRegPayments+"?schema=$schema&bp_number=${bpNumber}";
      var res =  await ServerRequest.getData(urlEndPoint: url);
      if(res != null && res['success'] == 200 && res['data'] != null){
        return BPNumberModel.fromJson(res['data']);
      }
    }catch(e){
      print(e.toString() + "---------------------==================");
    }
    return null;
  }

  static Future<dynamic> fetchBpNumberData({
    required String schema,
    required String bpNumber,
    required BuildContext context,
}) async {
    try {
        String url = Apis.getCustomer360Details+"?schema=$schema&bp_number=${bpNumber}";
        var res =  await ServerRequest.getData(urlEndPoint: url);
        if(res != null && res['success'] == 200 && res['data'] != null){
          return BPNumberModel.fromJson(res['data']);
        }
    }catch(e){
      print(e.toString() + "---------------------==================");
    }
    return null;
  }

  static Future<dynamic> imagePiker({required BuildContext context}) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? photo = await picker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 60,
          maxHeight: 1200,
          maxWidth: 950
      );
      if (photo != null) {
        return File(photo.path);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<dynamic> cameraPiker({required BuildContext context}) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? photo = await picker.pickImage(
          source: ImageSource.camera,
          imageQuality: 60,
          maxHeight: 1200,
          maxWidth: 950,
          preferredCameraDevice: CameraDevice.rear);
      if (photo != null) {
        return File(photo.path);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<dynamic> videoPiker({required BuildContext context}) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? photo = await picker.pickVideo(
          source: ImageSource.camera,
          maxDuration: const Duration(seconds: 10),
          preferredCameraDevice: CameraDevice.rear);
      if (photo != null) {
        return File(photo.path);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<dynamic> filePiker({required BuildContext context}) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'pdf', 'doc', "png"],
      );
      if(result != null){
        List<File> files = result.paths.map((path) => File(path!)).toList();
        String fileExtension =  files[0].path.toString().split('.').last;
        if(fileExtension.toString().toLowerCase() == "jpg"
            || fileExtension.toString().toLowerCase() == "pdf"
            || fileExtension.toString().toLowerCase() == "doc"
            || fileExtension.toString().toLowerCase() == "jpeg"
            || fileExtension.toString().toLowerCase() == "png" ){
          return files[0];
        } else {
          SnackBarErrorWidget(!context.mounted ? context : context).show(message: "Only allow PNG, JPG JPEG, DOC, PFG File.");
        }
        return null;
      } else{
        return null;
      }

    } catch (e) {
      return null;
    }
  }

  static getFileSize(File file) {
    int sizeInBytes = file.lengthSync();
    double sizeInMb = sizeInBytes / (1024 * 1024);
    return sizeInMb;
  }

  static fileDownLoad({required BuildContext context,
    required String url,
    required String fileName
  }) async {
    try{
      final key = GlobalKey();
      LoaderDialog.showLoadingDialog(context, key);
      var res =  await ServerRequest.downloadFile(url, fileName);
      if(res != null){
        File file =  res;
        await OpenFile.open(file.path.toString());
      }
      Navigator.of(context).pop();
    }catch(_){
      Navigator.of(context).pop();
    }
  }

}

mediaType({required BuildContext context,
  required VoidCallback onPressedCamera,
  required VoidCallback onPressedGallery}) {
  showModalBottomSheet(
    context: context, // Also default
    builder: (context) {
      return Container(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.18,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextButton(
                onPressed: onPressedCamera,
                child: TextWidget(
                  "Camera",
                  fontSize: AppFont.font_16,
                )),
            const Divider(),
            TextButton(
                onPressed: onPressedGallery,
                child: TextWidget(
                  "Gallery",
                  fontSize: AppFont.font_16,
                )),
          ],
        ),
      );
    },
  );
}


