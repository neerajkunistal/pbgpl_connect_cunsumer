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

class AddMaintenanceSelectServiceTypeEvent extends AddMaintenanceEvent {
  final MaintenanceServiceTypeModel serviceTypeData;

  AddMaintenanceSelectServiceTypeEvent({required this.serviceTypeData});

  @override
  List<Object?> get props => [serviceTypeData];
}


class AddMaintenanceSelectFileEvent extends AddMaintenanceEvent {
  final BuildContext context;
  final int mediaType;

  AddMaintenanceSelectFileEvent({required this.context, required this.mediaType});
  @override
  List<Object?> get props => [context, mediaType];
}

class AddMaintenanceSelectRequestDateEvent extends AddMaintenanceEvent {
  final BuildContext context;

  AddMaintenanceSelectRequestDateEvent({required this.context});
  @override
  List<Object?> get props => [context];
}


class AddMaintenanceSubmitEvent extends AddMaintenanceEvent {
  final BuildContext context;

  AddMaintenanceSubmitEvent({required this.context});
  @override
  List<Object?> get props => [context];
}