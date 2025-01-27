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
  final List<PaymentHistoryModel> paymentHistoryList;
  final List<PaymentHistoryModel> regPaymentHistoryList;
  final int tabIndex;

  FetchPaymentHistoryDataState({
    required this.paymentHistoryList,
  required this.regPaymentHistoryList,
  required this.tabIndex,
  });
  @override
  List<Object> get props => [
    paymentHistoryList,
    regPaymentHistoryList,
    tabIndex,
  ];
}