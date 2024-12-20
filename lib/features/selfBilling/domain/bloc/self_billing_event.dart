part of 'self_billing_bloc.dart';

sealed class SelfBillingEvent extends Equatable {
  const SelfBillingEvent();
}

class SelfBillingPageLoadEvent extends SelfBillingEvent {
  final BuildContext context;
  const SelfBillingPageLoadEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class SelfBillingSelectFileEvent extends SelfBillingEvent {
  final BuildContext context;
  final int mediaType;

  const SelfBillingSelectFileEvent({
    required this.context,
    required this.mediaType,
  });
  @override
  List<Object?> get props => [
    context,
    mediaType,
  ];
}

class SelfBillingSubmitEvent extends SelfBillingEvent {
  final BuildContext context;
  const SelfBillingSubmitEvent({required this.context});
  @override
  List<Object?> get props => [context];
}