part of 'add_payment_bloc.dart';

sealed class AddPaymentEvent extends Equatable {
  const AddPaymentEvent();
}

class AddPaymentPageLoadEvent extends AddPaymentEvent {
  final BuildContext context;
  final PaymentRequest paymentRequest;
  AddPaymentPageLoadEvent({required this.context, required this.paymentRequest});
  @override
  List<Object?> get props => [context, paymentRequest];
}

class AddPaymentDetailEvent extends AddPaymentEvent {
  final BuildContext context;
  AddPaymentDetailEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class AddPaymentPageCheckPaymentEvent extends AddPaymentEvent {
  final BuildContext context;
  AddPaymentPageCheckPaymentEvent({required this.context});
  @override
  List<Object?> get props => [context];
}