import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/helper/dashboard_helper.dart';
import 'package:customer_connect/features/payment/paymentHistory/domain/model/payment_history_model.dart';
import 'package:customer_connect/utills/commonWidgets/dotted_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentHistoryItemWidget extends StatelessWidget {
  final PaymentHistoryModel paymentHistoryData;

  const PaymentHistoryItemWidget({super.key,
  required this.paymentHistoryData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0.0),
      child: Card(
        elevation: 2,
        shadowColor: AppColor.themeColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  TextWidget("Order Id : ", fontWeight: FontWeight.w700, fontSize: AppFont.font_14,),
                  Expanded(child: TextWidget("${paymentHistoryData.orderId}",
                    textAlign: TextAlign.end,
                    fontWeight: FontWeight.w700, fontSize: AppFont.font_14,)),
                ],
              ),
              DottedDividerLine(),
              Row(
                children: [
                  TextWidget("Amount : ", fontWeight: FontWeight.w400, fontSize: AppFont.font_14,),
                  Expanded(child: TextWidget("₹${paymentHistoryData.amount}",
                    textAlign: TextAlign.end,
                    fontWeight: FontWeight.w400, fontSize: AppFont.font_14,)),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              Row(
                children: [
                  TextWidget("Paid Amount : ", fontWeight: FontWeight.w400, fontSize: AppFont.font_14,),
                  Expanded(child: TextWidget("₹${paymentHistoryData.paidAmount}",
                    textAlign: TextAlign.end,
                    fontWeight: FontWeight.w400, fontSize: AppFont.font_14,)),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),

              Row(
                children: [
                  TextWidget("Payment Mode : ", fontWeight: FontWeight.w400, fontSize: AppFont.font_14,),
                  Expanded(child: TextWidget("${paymentHistoryData.paymentMode}",
                    textAlign: TextAlign.end,
                    fontWeight: FontWeight.w400, fontSize: AppFont.font_14,)),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),

              Row(
                children: [
                  TextWidget("Date : ", fontWeight: FontWeight.w400, fontSize: AppFont.font_14,),
                  Expanded(child: TextWidget("${paymentHistoryData.createdAt}",
                    textAlign: TextAlign.end,
                    fontWeight: FontWeight.w400, fontSize: AppFont.font_14,)),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),

              Row(
                children: [
                  TextWidget("Payment Status : ", fontWeight: FontWeight.w400, fontSize: AppFont.font_14,),
                  Expanded(child: TextWidget("${paymentHistoryData.transactionStatus.toString() == "1" ? "Success" : "Fail"}",
                    textAlign: TextAlign.end,
                    fontWeight: FontWeight.w400, fontSize: AppFont.font_14,)),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),

              Row(
                children: [
                  TextWidget("Payment Type : ", fontWeight: FontWeight.w400, fontSize: AppFont.font_14,),
                  Expanded(child: TextWidget("${paymentHistoryData.paymentType}",
                    textAlign: TextAlign.end,
                    fontWeight: FontWeight.w400, fontSize: AppFont.font_14,)),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              paymentHistoryData.invoiceDownload.toString().isNotEmpty ?
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () async {
                    if(paymentHistoryData.invoiceDownload.toString().isNotEmpty){
                      await DashboardHelper.fileDownLoad(context: context,
                        url: paymentHistoryData.invoiceDownload.toString(),
                        fileName: "${paymentHistoryData.orderId.toString()}.pdf",
                      );
                    }
                  },
                  child: TextWidget("Invoice Download",
                    color: AppColor.cardBlue,
                    textDecoration: TextDecoration.underline,),
                ),
              ) : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
