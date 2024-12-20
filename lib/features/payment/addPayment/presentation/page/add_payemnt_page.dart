import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/payment/addPayment/domain/bloc/add_payment_bloc.dart';
import 'package:customer_connect/features/payment/addPayment/presentation/widget/payment_status_widget.dart';
import 'package:customer_connect/utills/commonWidgets/center_loader_widget.dart';
import 'package:flutter/material.dart';

class AddPaymentPage extends StatefulWidget {
  const AddPaymentPage({super.key});

  @override
  State<AddPaymentPage> createState() => _AddPaymentPageState();
}

class _AddPaymentPageState extends State<AddPaymentPage> with WidgetsBindingObserver {


  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    BlocProvider.of<AddPaymentBloc>(context).add(
        AddPaymentPageLoadEvent(context: context));
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.resumed:
        BlocProvider.of<AddPaymentBloc>(context)
            .add(AddPaymentPageCheckPaymentEvent(context: context));
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: TextWidget("Payment Page",
            fontWeight: FontWeight.w700,
            color: AppColor.white, fontSize: AppFont.font_16,),
        ),
      ),
      body: BlocBuilder<AddPaymentBloc, AddPaymentState>(
        builder: (context, state) {
          if(state is FetchAddPaymentDataState){
            return _itemBuilder(dataState: state);
          } else if( state is AddPaymentStatusState) {
            return PaymentStatusWidget(dataState : state);
          }else {
            return const Center(child: CenterLoaderWidget(),);
          }
        },
      ),
    );
  }

  Widget _itemBuilder({required FetchAddPaymentDataState dataState}) {
    return  Center(child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CenterLoaderWidget(),
        SizedBox(height: MediaQuery.of(context).size.width * 0.03,),
        TextWidget("Please don't back/refresh page", color: AppColor.black,),
      ],
    ),);
  }
}
