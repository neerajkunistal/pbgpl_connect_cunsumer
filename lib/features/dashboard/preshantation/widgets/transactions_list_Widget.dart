import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:customer_connect/features/payment/paymentHistory/presenation/widget/payment_history_item_box_widget.dart';
import 'package:flutter/material.dart';

class TransactionsListWidget extends StatelessWidget {
  const TransactionsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if(state is FetchDashboardDataState) {
          return state.bpNumberData.transactionList != null ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    TextWidget("Transactions",
                        color: AppColor.themeSecondary,
                        fontSize: AppFont.font_15,
                        fontWeight: FontWeight.w700),
                    Spacer(),
                    TextButton(
                      onPressed: () {

                      },
                      child: TextWidget("View All",
                          color: AppColor.themeColor,
                          fontSize: AppFont.font_14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              _listBuilder(dataState: state),
            ],
          ) : const SizedBox.shrink();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _listBuilder({required FetchDashboardDataState dataState}) {
    return ListView.builder(
        itemCount: dataState.bpNumberData.transactionList!.length > 5
            ? dataState.bpNumberData.transactionList!.length : 5,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              PaymentHistoryItemBoxWidget(transactionData : dataState.bpNumberData.transactionList![index]),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Divider(color: AppColor.lightGrey,)),
            ],
          );
        });
  }
}
