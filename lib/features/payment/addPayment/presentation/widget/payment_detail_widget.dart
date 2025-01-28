import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/payment/addPayment/domain/bloc/add_payment_bloc.dart';
import 'package:customer_connect/features/payment/addPayment/helper/add_payment_helper.dart';
import 'package:customer_connect/utills/commonWidgets/dotted_line_widget.dart';
import 'package:customer_connect/utills/commonWidgets/dotted_loader_widget.dart';
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
      child: SingleChildScrollView(
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
                label: "Amount",
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

            dataState.bpNumberData.paymentRequest == PaymentRequest.bill
                && dataState.isLoader == false ?
            _checkBoxPartialPayment(context: context, dataState: dataState)
                : const SizedBox.shrink(),

            dataState.isPartialPayment == true && dataState.isLoader == false ?
            _partialPaymentController(context: context, dataState: dataState)
                : const SizedBox.shrink(),

            dataState.isPartialPayment == true && dataState.isLoader == false ?
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.08,
            ): const SizedBox.shrink(),

            _payNowButton(context: context, dataState: dataState),
          ],
        ),
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

  Widget _checkBoxPartialPayment(
      {required BuildContext context, required AddPaymentDetailState dataState}) {
    return Row(
      children: [
        Checkbox(
            value: dataState.isPartialPayment,
            onChanged: (value) {
            BlocProvider.of<AddPaymentBloc>(context)
                .add(AddPaymentPartialPaymentEvent(isPartialPayment: value!, context: context));
          }
        ),
        TextWidget(" Partial Payment",)
      ],
    );
  }

  Widget _partialPaymentController({required BuildContext context, required AddPaymentDetailState dataState}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/1.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 5, bottom: 8),
          child: Row(
            children: [
              TextWidget(
                  "Minimum Bill Pay Amount",
                  fontSize: AppFont.font_12,
                  fontWeight: FontWeight.w700,
              ),
              TextWidget("* ", color: AppColor.red,),
              TextWidget(" : ₹${dataState.bpNumberData.partialPaymentData != null ? dataState.bpNumberData.partialPaymentData!.minPayAmount.toString() : "0"}",
                fontSize: AppFont.font_12,
                fontWeight: FontWeight.w700,),

            ],
          ),
          ),
          TextFieldWidget(
            isRequired: true,
            labelText: "Amount",
          controller: dataState.partialPaymentController,
          textInputType: TextInputType.number,
          ),
        ],
      ),
    );
  }

  Widget _payNowButton({required BuildContext context, required AddPaymentDetailState dataState}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/2,
      child: dataState.isLoader == false ?
      ButtonWidget(text: AppString.payNow,
          onPressed: () async {

         var paymentValidation = await AddPaymentHelper.partialAmountValidation(context: context,
                isPartialPayment: dataState.isPartialPayment,
                partialAmount: dataState.partialPaymentController.text.toString(),
                fullAmount: dataState.billAmountData.totalAmount.toString().replaceAll(",", "").toString(),
                minAmount: dataState.bpNumberData.partialPaymentData != null ?
                dataState.bpNumberData.partialPaymentData!.minPayAmount.toString().replaceAll(",", "").toString() : "1",
         ) ;

            if(paymentValidation == true){
              BlocProvider.of<AddPaymentBloc>(context).add(AddPaymentPageLoadEvent(
                  context: context, paymentRequest: dataState.bpNumberData.paymentRequest));
            }
       }) : const DottedLoaderWidget(),
    );
  }
}
