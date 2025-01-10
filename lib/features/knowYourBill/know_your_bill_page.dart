import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:flutter/material.dart';

class KnowYourBillPage extends StatefulWidget {
  const KnowYourBillPage({super.key});

  @override
  State<KnowYourBillPage> createState() => _KnowYourBillPageState();
}

class _KnowYourBillPageState extends State<KnowYourBillPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: AppColor.themeSecondary
        ),
        title: TextWidget(
          AppString.knowYourBill,
          color: AppColor.themeSecondary,
          fontWeight: FontWeight.w600,
          fontSize: AppFont.font_16,
        ),
      ),
    );
  }
}
