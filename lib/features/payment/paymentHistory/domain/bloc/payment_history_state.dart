part of 'payment_history_bloc.dart';

sealed class PaymentHistoryState extends Equatable {
  const PaymentHistoryState();
}

final class PaymentHistoryInitial extends PaymentHistoryState {
  @override
  List<Object> get props => [];
}


final class PaymentHistoryPageLoadState extends PaymentHistoryInitial {
  @override
  List<Object> get props => [];
}


final class FetchPaymentHistoryDataState extends PaymentHistoryInitial {
  @override
  List<Object> get props => [];
}