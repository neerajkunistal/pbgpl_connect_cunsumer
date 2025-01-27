import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/payment/paymentHistory/domain/bloc/payment_history_bloc.dart';
import 'package:customer_connect/features/payment/paymentHistory/presenation/widget/payment_history_item_widget.dart';
import 'package:customer_connect/utills/commonWidgets/center_loader_widget.dart';
import 'package:customer_connect/utills/commonWidgets/tab_bar_widget.dart';
import 'package:customer_connect/utills/commonWidgets/tab_item_widget.dart';
import 'package:flutter/material.dart';

class PaymentHistoryPage extends StatefulWidget {
  const PaymentHistoryPage({super.key});

  @override
  State<PaymentHistoryPage> createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends State<PaymentHistoryPage> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    BlocProvider.of<PaymentHistoryBloc>(context).add(
        PaymentHistoryPageLoadEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.01,
                ),
                _tabWidget(dataState:state),
                Expanded(child: _itemBuilder(dataState: state)),
              ],
            );
          } else {
            return const Center(child: CenterLoaderWidget());
          }
        },
      ),
    );
  }

  Widget _tabWidget({required FetchPaymentHistoryDataState dataState}) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TabBarWidget(
        controller: _tabController,
        onTap: (index) {
          BlocProvider.of<PaymentHistoryBloc>(context).add(
              PaymentHistorySelectTabIndexEvent(
                  tabIndex: index));
        },
        tabs: [
          TabItemWidget(title: "Billing", count: dataState.paymentHistoryList.length),
          TabItemWidget(title: "Registration", count: dataState.regPaymentHistoryList.length),
        ],
      ),
    );
  }

  Widget _itemBuilder({required FetchPaymentHistoryDataState  dataState}) {
    return dataState.tabIndex == 0
        ? _billList(dataState: dataState)
        : _registration(dataState: dataState);
  }

  Widget _billList({required FetchPaymentHistoryDataState  dataState}) {
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

  Widget _registration({required FetchPaymentHistoryDataState  dataState}) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: dataState.regPaymentHistoryList.isNotEmpty ?
      ListView.builder(
          shrinkWrap: true,
          itemCount: dataState.regPaymentHistoryList.length,
          itemBuilder: (context, index) {
            return PaymentHistoryItemWidget(paymentHistoryData: dataState.regPaymentHistoryList[index]);
          }) : const Center(child: TextWidget("No Registration Payment"),),
    );
  }
}
