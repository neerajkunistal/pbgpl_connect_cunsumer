import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/model/transaction_model.dart';
import 'package:customer_connect/features/dashboard/helper/dashboard_helper.dart';
import 'package:customer_connect/service/server_request.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'dart:math' as math;

import 'package:url_launcher/url_launcher.dart';

class BillHistoryItemBoxWidget extends StatelessWidget {
  final TransactionModel transactionData;

  const BillHistoryItemBoxWidget({super.key,
  required this.transactionData,
  });

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    DateTime dateTime = formatter.parse(transactionData.billGeneratedDate.toString());
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(child: Transform.rotate(
                  angle: 180 * math.pi / 105,
                  child: Icon(Icons.arrow_downward,
                   color: AppColor.themeColor,
                   size: MediaQuery.of(context).size.width * 0.07,
                  )),),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.04,
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget("Bill Generated", fontSize: AppFont.font_15,
                  fontWeight: FontWeight.w500,
                  ),
                  TextWidget("${DateFormat('dd-MM-yyyy').format(dateTime)}",
                      color: AppColor.grey,
                      fontSize: AppFont.font_12),
                  TextWidget("SCM Consumption : ${transactionData.consumption.toString()}",
                      color: AppColor.themeSecondary,
                      fontSize: AppFont.font_12),
                  TextWidget("Bill Type : ${transactionData.billTypeNameStatus.toString()}",
                      color: AppColor.black,
                      fontSize: AppFont.font_12),

                  GestureDetector(
                    onTap: () async {
                      if(transactionData.invoiceLink.toString().isNotEmpty){
                        await DashboardHelper.fileDownLoad(context: context,
                          url: transactionData.invoiceLink.toString(),
                          fileName: "${transactionData.id.toString()}.pdf",
                        );
                      }
                    },
                    child: TextWidget("Bill Download",
                        textDecoration: TextDecoration.underline,
                        color: AppColor.cardBlue,
                        fontSize: AppFont.font_14),
                  ),
          ],)),

          TextWidget("₹${transactionData.totalInvoiceAmount}", fontSize: AppFont.font_15,
            color: Colors.green[400],
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
