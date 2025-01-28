import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:customer_connect/features/dashboard/domain/model/bill_amount_model.dart';
import 'package:customer_connect/features/dashboard/domain/model/bp_number_model.dart';
import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/features/payment/addPayment/domain/model/payment_model.dart';
import 'package:customer_connect/features/payment/addPayment/domain/model/payment_status_model.dart';
import 'package:customer_connect/features/payment/addPayment/helper/add_payment_helper.dart';
import 'package:customer_connect/utills/commonClass/user_info.dart';
import 'package:customer_connect/utills/res/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
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
  bool isPayment =  false;
  PaymentRequest paymentRequest =  PaymentRequest.bill;

  final Razorpay _razorpay = Razorpay();

  bool isPartialPayment =  false;

  TextEditingController partialPaymentController =  TextEditingController();

  AddPaymentBloc() : super(AddPaymentInitial()) {
    on<AddPaymentPageLoadEvent>(_pageLoad);
    on<AddPaymentDetailEvent>(_paymentDetail);
    on<AddPaymentPartialPaymentEvent>(_selectPartialPayment);
    on<AddPaymentPageCheckPaymentEvent>(_checkPayment);
  }

  _pageLoad(AddPaymentPageLoadEvent event, emit) async {
     emit(AddPaymentPageLoadState());
     _paymentStatusData =  PaymentStatusModel();
     isPayment =  true;
     _userData =  UserInfo.instance!.userData!;
     _bpNumberData = BlocProvider.of<DashboardBloc>(event.context).bpNumberData;
      paymentRequest =  BlocProvider.of<DashboardBloc>(event.context).bpNumberData.paymentRequest;

     if(bpNumberData.paymentGateway == PaymentGateway.ccavenue)
     {
       var res =  await AddPaymentHelper.fetchCcavenuePaymentData(context: event.context,
           refId: bpNumberData.refId.toString(),
           schema: userData.schema.toString(),
           paymentRequest: paymentRequest,
           amount: partialPaymentController.text.toString(),
           partialPaymentType: isPartialPayment == true ? "1" : "0",
       );
       if(res != null){
         _paymentData =  res;
         url = "${paymentData.url}transaction.do?command=initiateTransaction&encRequest=${paymentData.encValue.toString()}&access_code=${paymentData.accessCode}";
       }

       if(url.isNotEmpty){
         _launchInAppWithBrowserOptions(Uri.parse(url));
       }
     }
     else if(bpNumberData.paymentGateway == PaymentGateway.razorPay)
     {
       _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
       _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
       _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
       var res =  await AddPaymentHelper.fetchRazorPaymentData(context: event.context,
         refId: bpNumberData.refId.toString(),
         schema: userData.schema.toString(),
         paymentRequest: paymentRequest,
         amount: partialPaymentController.text.toString(),
         partialPaymentType: isPartialPayment == true ? "1" : "0",
       );
       if(res != null){
         _paymentData =  res;
         _razorpay.open(paymentData.encValue);
       }
     }
     _eventComplete(emit);
  }

  _selectPartialPayment(AddPaymentPartialPaymentEvent event, emit) async {
    isPartialPayment =  event.isPartialPayment;
    partialPaymentController.text = "";
    isLoader = true;
    emit(AddPaymentDetailState(
        billAmountData: bpNumberData.billAmountData!,
        bpNumberData: bpNumberData,
        isPartialPayment: isPartialPayment,
        partialPaymentController: partialPaymentController,
        isLoader: isLoader,
        context: event.context)
    );

    if(isPartialPayment == true){
      var res =  await AddPaymentHelper.fetchPartialAmountData(context: event.context,
          refId: bpNumberData.refId.toString(),
          schema: userData.schema.toString(),
          paymentRequest: paymentRequest);
      if(res != null ){

      }
    }
    isLoader = false;
    emit(AddPaymentDetailState(
        billAmountData: bpNumberData.billAmountData!,
        bpNumberData: bpNumberData,
        isPartialPayment: isPartialPayment,
        partialPaymentController: partialPaymentController,
        isLoader: isLoader,
        context: event.context)
    );
  }

  _paymentDetail(AddPaymentDetailEvent event, emit) {
    _bpNumberData = BlocProvider.of<DashboardBloc>(event.context).bpNumberData;
    paymentRequest =  BlocProvider.of<DashboardBloc>(event.context).bpNumberData.paymentRequest;
    isPayment =  false;
    isPartialPayment =  false;
    isLoader = false;
    partialPaymentController.text = "";
    emit(AddPaymentDetailState(
        billAmountData: bpNumberData.billAmountData!,
        bpNumberData: bpNumberData,
        isPartialPayment: isPartialPayment,
        partialPaymentController: partialPaymentController,
        isLoader: isLoader,
        context: event.context)
    );
  }

  _checkPayment(AddPaymentPageCheckPaymentEvent event, emit) async {

    if(isPayment == true && paymentRequest == PaymentRequest.bill){
      var res =  await AddPaymentHelper.checkOrderConfirm(context: event.context,
          orderId: paymentData.orderId.toString(),
          schema:  userData.schema.toString());
      if(res !=  null) {
        _paymentStatusData =  res;
      }
      isPayment =  false;
      emit(AddPaymentStatusState(paymentStatusData: paymentStatusData));
    }
    else if(isPayment == true && paymentRequest == PaymentRequest.newConnection
         && bpNumberData.paymentGateway == PaymentGateway.ccavenue){
      var res =  await AddPaymentHelper.checkResOrderConfirm(context: event.context,
          orderId: paymentData.orderId.toString(),
          schema:  userData.schema.toString());
      if(res !=  null) {
        _paymentStatusData =  res;
      }
      isPayment =  false;
      emit(AddPaymentStatusState(paymentStatusData: paymentStatusData));
    }
    else if(isPayment == true && bpNumberData.paymentGateway == PaymentGateway.razorPay){
      var res =  await AddPaymentHelper.checkResOrderConfirmRazorPay(context: event.context,
                  paymentData: paymentData );
      if(res !=  null) {
        _paymentStatusData =  res;
      }
      isPayment =  false;
      emit(AddPaymentStatusState(paymentStatusData: paymentStatusData));
    }

  }

  _eventComplete(Emitter<AddPaymentState> emit) {
    emit(FetchAddPaymentDataState(url: url, isLoader: isLoader, paymentRequest: paymentRequest));
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

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    _paymentData.paymentId =  response.paymentId;
    _paymentData.paymentOrderId =  response.orderId;
    _paymentData.signature =  response.signature;
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print(response.code);
    print(response.message);
    print(response.error);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print(response.walletName);
  }

}
