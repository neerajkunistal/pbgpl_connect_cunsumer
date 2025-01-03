import 'dart:convert';

import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/model/file_model.dart';
import 'package:customer_connect/service/Apis.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_error_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path_provider/path_provider.dart';

class ServerRequest {


  static var header = {"Content-Type": "application/json"};

  static Future<dynamic> getData({required var urlEndPoint}) async {
    try {
      addToken();
      String url = Apis.baseUrl + urlEndPoint;
      log(Uri.parse(url.toString()).toString());
      log(header.toString());
      final response = await get(Uri.parse(url.toString()), headers: header)
          .timeout(const Duration(minutes: 2));
      log(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 500) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      if (e is SocketException) {
        log("SocketException : ${e.toString()}");
        return e.toString();
      } else if (e is TimeoutException) {
        log("TimeoutException : ${e.toString()}");
        return e.toString();
      } else {
        log("Unhandled exception : ${e.toString()}");
        return e.toString();
      }
    }
    return null;
  }

  static Future<dynamic> putData(
      {required var urlEndPoint, required var body}) async {
    try {
      addToken();
      String url = Apis.baseUrl + urlEndPoint;
      log(url);
      final response =
          await put(Uri.parse(url), headers: header, body: jsonEncode(body))
              .timeout(const Duration(minutes: 1));
      log(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 500) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      if (e is SocketException) {
        log("SocketException : ${e.toString()}");
        return e.toString();
      } else if (e is TimeoutException) {
        log("TimeoutException : ${e.toString()}");
        return e.toString();
      } else {
        log("Unhandled exception : ${e.toString()}");
        return e.toString();
      }
    }
    return null;
  }

  static Future<dynamic> postData(
      {required var urlEndPoint, required var body, required BuildContext context}) async {
    try {
      String url = Apis.baseUrl + urlEndPoint;
      log(url);
      addToken();
      print(body);
      log(header.toString());
      final response = await post(Uri.parse(url), headers: header, body: body)
          .timeout(const Duration(minutes: 1));
      log(response.body);
      if (response.statusCode == 200) {
        updateCookie(response);
        return jsonDecode(response.body);
      }
      else if (response.statusCode == 201) {
        updateCookie(response);
        return jsonDecode(response.body);
      }
      else if (response.statusCode == 404) {
        var json = jsonDecode(response.body);
        if(json.toString().contains("message")){
          SnackBarErrorWidget(!context.mounted ? context : context).show(message: json['message'].toString());
        }
        return null;
      }
      else {
        var json = jsonDecode(response.body);
        if(json.toString().contains("messages")){
          SnackBarErrorWidget(!context.mounted ? context : context).show(message: json['messages'].toString());
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("${e}Post Data ");
      }
      if (e is SocketException) {
        log("SocketException : ${e.toString()}");
        return e.toString();
      } else if (e is TimeoutException) {
        log("TimeoutException : ${e.toString()}");
        return e.toString();
      } else {
        log("Unhandled exception : ${e.toString()}");
        return e.toString();
      }
    }
  }

  static Future<dynamic> getGoogleData({required var url}) async {
    try {
      log(url.toString());
      final response =
          await get(url, headers: header).timeout(const Duration(minutes: 1));
      log(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 500) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      if (e is SocketException) {
        log("SocketException : ${e.toString()}");
        return e.toString();
      } else if (e is TimeoutException) {
        log("TimeoutException : ${e.toString()}");
        return e.toString();
      } else {
        log("Unhandled exception : ${e.toString()}");
        return e.toString();
      }
    }
    return null;
  }

  static Future<dynamic> postDataWithFile(
      {required String urlEndPoint,
        required var body,
        required BuildContext context,
        String? filePath,
        String? keyWord,
        List<FileModel>? fileList}) async {
    try {
      addToken();
      String url = Apis.baseUrl + urlEndPoint;
      Uri uri = Uri.parse(url);
      log(url);
      log(body.toString());
      log(header.toString());

      var request = MultipartRequest("POST", uri);
      if (fileList != null && fileList.isNotEmpty) {
        for (var fileData in fileList) {
          if (fileData.file.path.isNotEmpty) {
            String fileExtention = fileData.file.path.split(".").last;
            String filePath0 =
            (fileExtention.toString().toLowerCase() != "png"
                || fileExtention.toString().toLowerCase() != "jpg"
                || fileExtention.toString().toLowerCase() != "jpeg")
                ? fileData.file.path.toString()
                : await fileCompress(file: fileData.file);
            if (fileData.file.toString().isNotEmpty) {
              var uploadFile = await MultipartFile.fromPath(
                  fileData.keyName, filePath0,
                  contentType: MediaType("file", fileExtention));
              request.files.add(uploadFile);
            }
          } else if (fileData.keyName.isNotEmpty) {
            var uploadFile = await MultipartFile.fromPath(fileData.keyName, "",
                contentType: MediaType("file", ""));
            request.files.add(uploadFile);
          }
        }
      } else {
        if (filePath != null && filePath.isNotEmpty && keyWord != null) {
          if (filePath.isNotEmpty) {
            File file = File(filePath);
            String fileExtention = filePath.split(".").last;
            String filePath1 = fileExtention.toString().toLowerCase() == "png"
                || fileExtention.toString().toLowerCase() == "jpg"
                || fileExtention.toString().toLowerCase() == "jpeg"
                ? await fileCompress(file: file)
                : file.path.toString();
            var uploadFile = await MultipartFile.fromPath(keyWord, filePath1,
                contentType: MediaType("file", fileExtention));
            request.files.add(uploadFile);
          }
        }
      }
      request.fields.addAll(body);
      request.headers.addAll(header);
      var response = await request.send();
      var responseData = await response.stream.toBytes();
      var result = json.decode(String.fromCharCodes(responseData));
      log(result.toString());
      if (response.statusCode == 200) {
        var result = json.decode(String.fromCharCodes(responseData));
        log(result.toString());
        return result;
      } else {
        var result = json.decode(String.fromCharCodes(responseData));
        if(result.toString().contains("message")){
          SnackBarErrorWidget(!context.mounted ? context : context).show(message: result['message'].toString());
        }
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<String> fileCompress({required File file}) async {
    final filePath = file.path;
    final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
    final splitted = filePath.substring(0, (lastIndex));
    final outPath = '${splitted}_out${filePath.substring(lastIndex)}';
    var result = await FlutterImageCompress.compressAndGetFile(
      file.path,
      outPath,
      quality: 70,
    );
    return result!.path.toString();
  }

  static Future<dynamic> firebasePushNotification({var url, var body}) async {
    try {
      var headerData = {
        HttpHeaders.authorizationHeader:
            "key=AAAAvUcSq7Y:APA91bHC67iO0x0DER3_DU37-ZoaVq7CgKqpi3P2GhBxAMSu2Thhv93MydFigrXDuhf-Tx8OsfEtywE0pVxdA2TBa_JsQG8ZTHQ2lTzha1D0M63ZdljYYq0cD2db6Ll5LAB-ZZtbRzOc",
        "Content-Type": "application/json; charset=UTF-8"
      };
      log(url);
      log(jsonEncode(body));
      final response = await post(Uri.parse(url),
          headers: headerData, body: jsonEncode(body));
      log(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      if (e is SocketException) {
        log("SocketException : ${e.toString()}");
      } else if (e is TimeoutException) {
        log("TimeoutException : ${e.toString()}");
      } else {
        log("Unhandled exception : ${e.toString()}");
      }
    }
    return null;
  }

  static updateCookie(Response response) {
    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      header['cookie'] =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }

  static addToken() {
    try{
      // String token = "";
      // header["Authorization"] = token;
    } catch(_){
      // header["Authorization"] = "";
    }

  }

  static Future<dynamic> iglPost({var url, var body,
         required String userName, required String password}) async {
    try {
      var headerData = {
      "Authorization" : 'Basic ${base64.encode(utf8.encode('$userName:$password'))}',
      "Content-Type": "application/json; charset=UTF-8"
      };
      log(url);
      log(jsonEncode(body));
      final response = await post(Uri.parse(url),
          headers: headerData, body: jsonEncode(body));
      log(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      if (e is SocketException) {
        log("SocketException : ${e.toString()}");
      } else if (e is TimeoutException) {
        log("TimeoutException : ${e.toString()}");
      } else {
        log("Unhandled exception : ${e.toString()}");
      }
    }
    return null;
  }

  static Future<dynamic> downloadFile(String url, String filename) async {
    try {
      var httpClient = new HttpClient();
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
     /* String dir = (await getApplicationDocumentsDirectory()).path;*/
      bool dirDownloadExists = true;
      var directory;
      if (Platform.isIOS) {
        directory = await getDownloadsDirectory();
      } else {
        directory = "/storage/emulated/0/Download/";
        dirDownloadExists = await Directory(directory).exists();
        if(dirDownloadExists){
          directory = "/storage/emulated/0/Download/";
        }else{
          directory = "/storage/emulated/0/Downloads/";
        }
      }
      File file = new File('$directory/$filename');
      await file.writeAsBytes(bytes);
      return file;
    } catch(e){
      print("Download ------------------- ${e.toString()}");
    }
    return null;
  }

}
