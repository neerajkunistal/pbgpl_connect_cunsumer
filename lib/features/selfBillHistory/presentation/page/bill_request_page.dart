import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/selfBillHistory/domain/bloc/bill_request_bloc.dart';
import 'package:customer_connect/utills/commonWidgets/center_loader_widget.dart';
import 'package:flutter/material.dart';

class BillRequestPage extends StatefulWidget {
  const BillRequestPage({super.key});

  @override
  State<BillRequestPage> createState() => _BillRequestPageState();
}

class _BillRequestPageState extends State<BillRequestPage> {

  @override
  void initState() {
    BlocProvider.of<BillRequestBloc>(context)
        .add(BillRequestPageLoadEvent(context: context));
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
          AppString.selfBillHistory,
          color: AppColor.themeSecondary,
          fontWeight: FontWeight.w600,
          fontSize: AppFont.font_16,
        ),
      ),
      body: BlocBuilder<BillRequestBloc, BillRequestState>(
        builder: (context, state) {
          if(state is FetchBillRequestDataState){
              return _itemBuilder(dataState: state);
          } else {
            return const Center(child: CenterLoaderWidget());
          }
        },
      ),
    );
  }

  Widget _itemBuilder({required FetchBillRequestDataState  dataState}) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: dataState.selfBillList.isNotEmpty ?
      ListView.builder(
          shrinkWrap: true,
          itemCount: dataState.selfBillList.length,
          itemBuilder: (context, index) {
          return Container(

          );
      }) : const Center(child: TextWidget("No Self Bill History"),),
    );
  }

}
