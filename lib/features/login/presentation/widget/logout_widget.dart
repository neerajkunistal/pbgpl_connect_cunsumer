import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.4,
      margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.04),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          TextWidget(
            AppString.logout + "?",
            fontWeight: FontWeight.w600,
            fontSize: AppFont.font_22,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          TextWidget(
            AppString.logoutMessage,
            textAlign: TextAlign.center,
            color: AppColor.black,
            fontSize: AppFont.font_14,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          ButtonWidget(
              text: AppString.logout,
              onPressed: () async {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginView()),
                    (route) => false);
                SharedPreferencesUtils.clearAll();
              }),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          ButtonWidget(
              text: AppString.cancel,
              backgroundColor: AppColor.white,
              isSideBoard: true,
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }
}
