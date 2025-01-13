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
  final PaymentRequest paymentRequest;

  FetchAddPaymentDataState({required this.url,
    required this.isLoader,
    required this.paymentRequest});
  @override
  List<Object> get props => [
    isLoader,
    paymentRequest,
    url
  ];
}

final class AddPaymentDetailState extends AddPaymentInitial {
  final BuildContext context;
  final BillAmountModel billAmountData;

  AddPaymentDetailState({required this.billAmountData, required this.context});
  @override
  List<Object> get props => [
    billAmountData,
    context
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