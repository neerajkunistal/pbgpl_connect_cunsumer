import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:customer_connect/features/payment/paymentHistory/domain/model/payment_history_model.dart';
import 'package:flutter/cupertino.dart';

part 'payment_history_event.dart';
part 'payment_history_state.dart';

class PaymentHistoryBloc extends Bloc<PaymentHistoryEvent, PaymentHistoryState> {

  List<PaymentHistoryModel> _paymentHistoryList = [];
  List<PaymentHistoryModel> get paymentHistoryList => _paymentHistoryList;

  PaymentHistoryBloc() : super(PaymentHistoryInitial()) {
    on<PaymentHistoryPageLoadEvent>(_pageLoad);
  }

  _pageLoad(PaymentHistoryPageLoadEvent event, emit) async {
     emit(PaymentHistoryPageLoadState());
     _paymentHistoryList = [];
     try{
       _paymentHistoryList = BlocProvider.of<DashboardBloc>(event.context).bpNumberData.paymentHistoryList!;
     }catch(_){}
    _eventComplete(emit);
  }

  _eventComplete(Emitter<PaymentHistoryState> emit) {
    emit(FetchPaymentHistoryDataState(
      paymentHistoryList: paymentHistoryList
    ));
  }

}
