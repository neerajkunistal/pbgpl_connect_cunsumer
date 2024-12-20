import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/payment/addPayment/domain/bloc/add_payment_bloc.dart';
import 'package:customer_connect/utills/res/app_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentStatusWidget extends StatelessWidget {
  final AddPaymentStatusState dataState;
  const PaymentStatusWidget({super.key,
   required this.dataState,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Align(
             alignment: Alignment.center,
             child: Image.asset(dataState.paymentStatusData.transactionStatus.toString() == "1" ?
             AppIcon.paymentSuccessIcon : AppIcon.paymentFailIcon,
               height: MediaQuery.of(context).size.width * 0.18,),
           ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.02,
          ),
          TextWidget("Your payment was ${dataState.paymentStatusData.transactionStatus.toString() == "1" ? "successful" : "Fail"}",
            fontSize: AppFont.font_18,
            fontWeight: FontWeight.w700,
            color: AppColor.grey,),

          TextWidget("Thank you for your payment.We will \nbe in contact with more details shortly",
            textAlign: TextAlign.center,
            fontSize: AppFont.font_12,
            color: AppColor.black,),

          SizedBox(
            height: MediaQuery.of(context).size.width * 0.03,
          ),

          TextWidget("Order Id : ${dataState.paymentStatusData.orderId}",
            fontSize: AppFont.font_14,
            fontWeight: FontWeight.w700,
            color: AppColor.black,),

          SizedBox(
            height: MediaQuery.of(context).size.width * 0.01,
          ),

          TextWidget("Payment Methode : ${dataState.paymentStatusData.paymentMode}",
            fontSize: AppFont.font_14,
            fontWeight: FontWeight.w700,
            color: AppColor.black,),

          SizedBox(
            height: MediaQuery.of(context).size.width * 0.01,
          ),

          TextWidget("Amount : ${dataState.paymentStatusData.paidAmount}",
            fontSize: AppFont.font_14,
            fontWeight: FontWeight.w700,
            color: AppColor.black,),

          SizedBox(
            height: MediaQuery.of(context).size.width * 0.03,
          ),

          SizedBox(
            width: MediaQuery.of(context).size.width/2,
            child: ButtonWidget(text: "Go To Home",
                onPressed: () {
              String status =  dataState.paymentStatusData.transactionStatus.toString() == "1" ?  "Complete" : "Fail";
              Navigator.of(context).pop(status);
            }),
          ),
        ],
      ),
    );
  }
}
