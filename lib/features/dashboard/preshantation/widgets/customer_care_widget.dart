import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void customerCareWidget({required BuildContext context}) {
  showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    isScrollControlled: true,
    enableDrag: true,
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: MediaQuery.of(context).size.height/4,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.center,
                      child: TextWidget("Contact",color: AppColor.black, fontSize: AppFont.font_16, fontWeight: FontWeight.w700,)
                  ),
                ),
                Card(
                  elevation: 2,
                  shadowColor: Colors.black,
                  child: InkWell(
                    onTap: () async {
                      Navigator.of(context).pop();
                      if (!await launchUrl(Uri.parse("tel://+91-00000000000"))) {
                        throw Exception('Could not launch ${"tel://+91-00000000000"}');
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextWidget("SOS", color: AppColor.black, fontSize: AppFont.font_14, fontWeight: FontWeight.w700,),
                                TextWidget("+91-00000000000", color: AppColor.black, fontSize: AppFont.font_14,),
                              ],
                            ),
                          ),
                          Icon(Icons.call, color: AppColor.cardBlue,),
                        ],
                      ),
                    ),
                  ),
                ),

                Card(
                  elevation: 2,
                  shadowColor: Colors.black,
                  child: InkWell(
                    onTap: () async {
                      Navigator.of(context).pop();
                      if (!await launchUrl(Uri.parse("tel://+91-00000000000"))) {
                        throw Exception('Could not launch ${"tel://+91-00000000000"}');
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextWidget("Customer care number", color: AppColor.black, fontSize: AppFont.font_14, fontWeight: FontWeight.w700,),
                                TextWidget("+91-00000000000", color: AppColor.black, fontSize: AppFont.font_14,),
                              ],
                            ),
                          ),
                          Icon(Icons.call, color: AppColor.cardBlue,),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      );
    },
  );
}