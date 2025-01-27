import 'package:flutter/material.dart';

import '../../ExportFile/app_export_file.dart';

class SnackBarSuccessWidget {
  final BuildContext context;

  SnackBarSuccessWidget(this.context);

  show({required dynamic message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: TextWidget(
        message.toString(),
        fontSize: AppFont.font_14,
        color: AppColor.white,
      ),
      backgroundColor: AppColor.themeColor,
    ));
  }
}
