part of 'bill_request_bloc.dart';

sealed class BillRequestEvent extends Equatable {
  const BillRequestEvent();
}

class BillRequestPageLoadEvent extends BillRequestEvent {
  final BuildContext context;
  const BillRequestPageLoadEvent({required this.context});
  @override
  List<Object?> get props => [context];
}