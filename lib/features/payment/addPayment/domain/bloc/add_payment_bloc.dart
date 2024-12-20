import 'package:bloc/bloc.dart';
import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:customer_connect/features/dashboard/domain/model/bp_number_model.dart';
import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/features/payment/addPayment/domain/model/payment_model.dart';
import 'package:customer_connect/features/payment/addPayment/domain/model/payment_status_model.dart';
import 'package:customer_connect/features/payment/addPayment/helper/add_payment_helper.dart';
import 'package:customer_connect/utills/commonClass/user_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

part 'add_payment_event.dart';
part 'add_payment_state.dart';

class AddPaymentBloc extends Bloc<AddPaymentEvent, AddPaymentState> {
  bool isLoader =  false;
  String url = "";

  LoginModel _userData =  LoginModel();
  LoginModel get userData => _userData;

  PaymentModel _paymentData =  PaymentModel();
  PaymentModel get paymentData => _paymentData;

  BPNumberModel _bpNumberData =  BPNumberModel();
  BPNumberModel get bpNumberData =>  _bpNumberData;

  PaymentStatusModel _paymentStatusData =  PaymentStatusModel();
  PaymentStatusModel get paymentStatusData => _paymentStatusData;

  AddPaymentBloc() : super(AddPaymentInitial()) {
    on<AddPaymentPageLoadEvent>(_pageLoad);
    on<AddPaymentPageCheckPaymentEvent>(_checkPayment);
  }

  _pageLoad(AddPaymentPageLoadEvent event, emit) async {
     emit(AddPaymentPageLoadState());
     _paymentStatusData =  PaymentStatusModel();
     _userData =  UserInfo.instance!.userData!;
     _bpNumberData = BlocProvider.of<DashboardBloc>(event.context).bpNumberData;

     var res =  await AddPaymentHelper.fetchPaymentData(context: event.context,
         refId: bpNumberData.refId.toString(),
         schema: userData.schema.toString());
     if(res != null){
       _paymentData =  res;
       url = "${paymentData.url}transaction.do?command=initiateTransaction&encRequest=${paymentData.encValue}&access_code=${paymentData.accessCode}";
       if(url.isNotEmpty){
         _launchInAppWithBrowserOptions(Uri.parse(url));
       }
     }
     _eventComplete(emit);
  }

  _checkPayment(AddPaymentPageCheckPaymentEvent event, emit) async {
    var res =  await AddPaymentHelper.checkOrderConfirm(context: event.context,
          orderId: paymentData.orderId.toString(),
        schema:  userData.schema.toString());
    if(res !=  null) {
      _paymentStatusData =  res;
    }
    emit(AddPaymentStatusState(paymentStatusData: paymentStatusData));
  }

  _eventComplete(Emitter<AddPaymentState> emit) {
    emit(FetchAddPaymentDataState(url: url, isLoader: isLoader));
  }

  _launchInAppWithBrowserOptions(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppBrowserView,
      browserConfiguration: const BrowserConfiguration(showTitle: true),
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
