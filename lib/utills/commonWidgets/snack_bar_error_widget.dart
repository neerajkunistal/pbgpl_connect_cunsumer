import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:flutter/material.dart';

class SnackBarErrorWidget {
  final BuildContext context;

  SnackBarErrorWidget(this.context);

  show({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColor.themeSecondary,
        content: TextWidget(
      message,
      fontSize: AppFont.font_14,
      color: AppColor.red,
    )));
  }
}
