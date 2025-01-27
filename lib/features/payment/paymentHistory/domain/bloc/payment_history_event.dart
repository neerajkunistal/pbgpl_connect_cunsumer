part of 'payment_history_bloc.dart';

sealed class PaymentHistoryEvent extends Equatable {
  const PaymentHistoryEvent();
}

class PaymentHistoryPageLoadEvent extends PaymentHistoryEvent {
  final BuildContext context;
  const PaymentHistoryPageLoadEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class PaymentHistorySelectTabIndexEvent extends PaymentHistoryEvent {
  final int tabIndex;
  const PaymentHistorySelectTabIndexEvent({required this.tabIndex});
  @override
  List<Object?> get props => [tabIndex];
}
