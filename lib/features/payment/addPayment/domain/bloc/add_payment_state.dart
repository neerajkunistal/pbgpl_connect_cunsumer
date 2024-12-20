part of 'add_payment_bloc.dart';

sealed class AddPaymentState extends Equatable {
  const AddPaymentState();
}

final class AddPaymentInitial extends AddPaymentState {
  @override
  List<Object> get props => [];
}

final class AddPaymentPageLoadState extends AddPaymentInitial {
  @override
  List<Object> get props => [];
}


final class FetchAddPaymentDataState extends AddPaymentInitial {
  final bool isLoader;
  final String url;

  FetchAddPaymentDataState({required this.url, required this.isLoader});
  @override
  List<Object> get props => [
    isLoader,
    url
  ];
}

final class AddPaymentStatusState extends AddPaymentInitial {
  final PaymentStatusModel paymentStatusData;

  AddPaymentStatusState({required this.paymentStatusData});
  @override
  List<Object> get props => [
    paymentStatusData,
  ];
}