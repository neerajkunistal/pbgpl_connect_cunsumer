part of 'add_disconnection_bloc.dart';

sealed class AddDisconnectionEvent extends Equatable {
  const AddDisconnectionEvent();
}

class AddDisconnectionPageLoadEvent extends AddDisconnectionEvent {
  final BuildContext context;

  AddDisconnectionPageLoadEvent({required this.context});

  @override
  List<Object?> get props => [context];

}

class AddDisconnectionSelectDisconnectionTypeEvent extends AddDisconnectionEvent {
  final DisconnectionTypeModel disconnectionTypeData;

  AddDisconnectionSelectDisconnectionTypeEvent({required this.disconnectionTypeData});

  @override
  List<Object?> get props => [disconnectionTypeData];
}

class AddDisconnectionSelectDisconnectionReasonTypeEvent extends AddDisconnectionEvent {
  final DisconnectionReasonType disconnectionReasonTypeData;

  AddDisconnectionSelectDisconnectionReasonTypeEvent({required this.disconnectionReasonTypeData});

  @override
  List<Object?> get props => [disconnectionReasonTypeData];
}

class AddDisconnectionSelectFileEvent extends AddDisconnectionEvent {
  final BuildContext context;
  final int mediaType;

  AddDisconnectionSelectFileEvent({required this.context, required this.mediaType});
  @override
  List<Object?> get props => [context, mediaType];
}

class AddDisconnectionSelectRequestDateEvent extends AddDisconnectionEvent {
  final BuildContext context;

  AddDisconnectionSelectRequestDateEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class AddDisconnectionSelectDisconnectionRequestDateEvent extends AddDisconnectionEvent {
  final BuildContext context;

  AddDisconnectionSelectDisconnectionRequestDateEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class AddDisconnectionSubmitEvent extends AddDisconnectionEvent {
  final BuildContext context;

  AddDisconnectionSubmitEvent({required this.context});
  @override
  List<Object?> get props => [context];
}