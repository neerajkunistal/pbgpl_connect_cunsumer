import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/payment/addPayment/domain/bloc/add_payment_bloc.dart';
import 'package:customer_connect/utills/commonWidgets/dotted_line_widget.dart';
import 'package:customer_connect/utills/res/enums.dart';
import 'package:flutter/material.dart';

class PaymentDetailWidget extends StatelessWidget {
  final AddPaymentDetailState dataState;

  const PaymentDetailWidget({super.key, required this.dataState});

  @override
  Widget build(BuildContext context) {

    double totalAmount =  double.parse(dataState.billAmountData.totalAmount.toString().isNotEmpty ? dataState.billAmountData.totalAmount.toString().replaceAll(",", "").toString() : "0");
    double lateFee =  double.parse(dataState.billAmountData.lateFee.toString().isNotEmpty ? dataState.billAmountData.lateFee.toString().replaceAll(",", "").toString() : "0");

    double amount = totalAmount-lateFee;

    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.08,
          ),
          Align(
            alignment: Alignment.center,
            child: TextWidget(
              "Payment Detail",
              fontSize: AppFont.font_16,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.08,
          ),
          DottedDividerLine(),
          _rowWidget(
              label: "Bill Amount",
              value: "${amount}"),
          _rowWidget(
              label: "Late Fee",
              value: dataState.billAmountData.lateFee.toString()),
          DottedDividerLine(),
          _rowWidget(
              label: "Total Amount",
              value: "${totalAmount}"),
          DottedDividerLine(),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.08,
          ),
          _payNowButton(context: context, dataState: dataState),
        ],
      ),
    );
  }

  Widget _rowWidget({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          TextWidget(
            label,
            color: AppColor.black,
            fontWeight: FontWeight.w500,
            fontSize: AppFont.font_13,
          ),
          Expanded(
              child: TextWidget("₹${value}",
                  color: AppColor.black,
                  textAlign: TextAlign.right,
                  fontWeight: FontWeight.w500,
                  fontSize: AppFont.font_13)),
        ],
      ),
    );
  }

  Widget _payNowButton({required BuildContext context, required AddPaymentDetailState dataState}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/2,
      child: ButtonWidget(text: AppString.payNow, onPressed: () {
        BlocProvider.of<AddPaymentBloc>(context).add(AddPaymentPageLoadEvent(
            context: context, paymentRequest: dataState.bpNumberData.paymentRequest));
      }),
    );
  }
}
