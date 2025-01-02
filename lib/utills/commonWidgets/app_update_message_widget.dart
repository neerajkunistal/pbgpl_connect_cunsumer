import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/utills/commonWidgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUpdateMessage {
  static showAlertDialog(
      {required BuildContext context, required String url, bool? isLater}) {
    Widget cancelButton = TextButton(
      child: isLater == null
          ? TextWidget(
              "Update Later",
              fontSize: AppFont.font_14,
            )
          : isLater == true
              ? const SizedBox.shrink()
              : TextWidget(
                  "Update Later",
                  fontSize: AppFont.font_14,
                ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: TextWidget(
        "Update Now",
        fontSize: AppFont.font_14,
        color: AppColor.themeColor,
        fontWeight: FontWeight.w700,
      ),
      onPressed: () async {
        if (!await launchUrl(
          Uri.parse(url),
          mode: LaunchMode.externalApplication,
        )) {
          throw Exception('Could not launch ');
        }
      },
    );
    AlertDialog alert = AlertDialog(
      title: Builder(builder: (context) {
        return TextWidget(
          "Update Available",
          fontSize: AppFont.font_16,
          fontWeight: FontWeight.w700,
        );
      }),
      content: TextWidget(
        "Please update the app to continue",
        fontSize: AppFont.font_14,
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      barrierDismissible: isLater ?? false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
