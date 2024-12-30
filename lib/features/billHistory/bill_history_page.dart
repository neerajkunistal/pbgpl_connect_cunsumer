import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:customer_connect/features/payment/paymentHistory/presenation/widget/bill_history_item_box_widget.dart';
import 'package:customer_connect/utills/commonWidgets/center_loader_widget.dart';
import 'package:flutter/material.dart';

class BillHistoryPage extends StatefulWidget {
  const BillHistoryPage({super.key});

  @override
  State<BillHistoryPage> createState() => _BillHistoryPageState();
}

class _BillHistoryPageState extends State<BillHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: AppColor.themeSecondary
        ),
        title: TextWidget(
          AppString.billHistory,
          color: AppColor.themeSecondary,
          fontWeight: FontWeight.w600,
          fontSize: AppFont.font_16,
        ),
      ),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if(state is FetchDashboardDataState){
            return Container(
              margin: EdgeInsets.all(10.0),
              child: _listBuilder(dataState: state),
            );
          } else {
            return Center(child: CenterLoaderWidget());
          }
        },
      ),
    );
  }

  Widget _listBuilder({required FetchDashboardDataState dataState}) {
    return ListView.builder(
        itemCount: dataState.bpNumberData.transactionList!.length ,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              BillHistoryItemBoxWidget(transactionData : dataState.bpNumberData.transactionList![index]),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Divider(color: AppColor.lightGrey,)),
            ],
          );
        });
  }
}
