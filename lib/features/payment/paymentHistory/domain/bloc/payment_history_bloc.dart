import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'payment_history_event.dart';
part 'payment_history_state.dart';

class PaymentHistoryBloc extends Bloc<PaymentHistoryEvent, PaymentHistoryState> {

  PaymentHistoryBloc() : super(PaymentHistoryInitial()) {
    on<PaymentHistoryPageLoadEvent>(_pageLoad);
  }

  _pageLoad(PaymentHistoryPageLoadEvent event, emit) async {
    _eventComplete(emit);
  }

  _eventComplete(Emitter<PaymentHistoryState> emit) {
    emit(FetchPaymentHistoryDataState());
  }

}
