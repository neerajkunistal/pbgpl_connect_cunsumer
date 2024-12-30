import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/payment/paymentHistory/domain/bloc/payment_history_bloc.dart';
import 'package:customer_connect/features/payment/paymentHistory/presenation/widget/payment_history_item_widget.dart';
import 'package:customer_connect/utills/commonWidgets/center_loader_widget.dart';
import 'package:flutter/material.dart';

class PaymentHistoryPage extends StatefulWidget {
  const PaymentHistoryPage({super.key});

  @override
  State<PaymentHistoryPage> createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends State<PaymentHistoryPage> {

  @override
  void initState() {
    BlocProvider.of<PaymentHistoryBloc>(context).add(
        PaymentHistoryPageLoadEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: AppColor.themeSecondary
        ),
        title: TextWidget(
          AppString.paymentHistory,
          color: AppColor.themeSecondary,
          fontWeight: FontWeight.w600,
          fontSize: AppFont.font_16,
        ),
      ),
      body: BlocBuilder<PaymentHistoryBloc, PaymentHistoryState>(
        builder: (context, state) {
          if(state is FetchPaymentHistoryDataState){
            return _itemBuilder(dataState: state);
          } else {
            return const Center(child: CenterLoaderWidget());
          }
        },
      ),
    );
  }

  Widget _itemBuilder({required FetchPaymentHistoryDataState  dataState}) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: dataState.paymentHistoryList.isNotEmpty ?
      ListView.builder(
          shrinkWrap: true,
          itemCount: dataState.paymentHistoryList.length,
          itemBuilder: (context, index) {
            return PaymentHistoryItemWidget(paymentHistoryData: dataState.paymentHistoryList[index]);
          }) : const Center(child: TextWidget("No Payment History"),),
    );
  }
}
