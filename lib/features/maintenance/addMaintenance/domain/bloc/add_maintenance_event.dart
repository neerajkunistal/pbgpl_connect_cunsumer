part of 'add_maintenance_bloc.dart';

sealed class AddMaintenanceEvent extends Equatable {
  const AddMaintenanceEvent();
}


class AddMaintenancePageLoadEvent extends AddMaintenanceEvent {
  final BuildContext context;

  AddMaintenancePageLoadEvent({required this.context});

  @override
  List<Object?> get props => [context];

}

class AddMaintenanceSelectDisconnectionTypeEvent extends AddMaintenanceEvent {
  final DisconnectionTypeModel disconnectionTypeData;

  AddMaintenanceSelectDisconnectionTypeEvent({required this.disconnectionTypeData});

  @override
  List<Object?> get props => [disconnectionTypeData];
}

class AddMaintenanceSelectDisconnectionReasonTypeEvent extends AddMaintenanceEvent {
  final DisconnectionReasonType disconnectionReasonTypeData;

  AddMaintenanceSelectDisconnectionReasonTypeEvent({required this.disconnectionReasonTypeData});

  @override
  List<Object?> get props => [disconnectionReasonTypeData];
}

class AddMaintenanceSelectFileEvent extends AddMaintenanceEvent {
  final BuildContext context;

  AddMaintenanceSelectFileEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class AddMaintenanceSelectRequestDateEvent extends AddMaintenanceEvent {
  final BuildContext context;

  AddMaintenanceSelectRequestDateEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class AddMaintenanceSelectDisconnectionRequestDateEvent extends AddMaintenanceEvent {
  final BuildContext context;

  AddMaintenanceSelectDisconnectionRequestDateEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class AddMaintenanceSubmitEvent extends AddMaintenanceEvent {
  final BuildContext context;

  AddMaintenanceSubmitEvent({required this.context});
  @override
  List<Object?> get props => [context];
}