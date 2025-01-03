import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderDialog {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
              key: key,
              backgroundColor: Colors.transparent,
              elevation: 0,
              children: <Widget>[
                Center(
                  child: Column(children: [
                    Container(
                      color: Colors.transparent,
                      width: MediaQuery.of(context).size.width/2,
                      child: Column(
                        children: [
                          SpinKitFadingCircle(
                            color: AppColor.themeColor,
                            size: 50.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextWidget(
                              "Please Wait",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ]);
        });
  }
}
