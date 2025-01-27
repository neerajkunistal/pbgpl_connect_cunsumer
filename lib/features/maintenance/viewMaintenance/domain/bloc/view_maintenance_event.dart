part of 'view_maintenance_bloc.dart';

sealed class ViewMaintenanceEvent extends Equatable {
  const ViewMaintenanceEvent();
}

class ViewMaintenancePageLoadEvent extends ViewMaintenanceEvent {
    final BuildContext context;
    ViewMaintenancePageLoadEvent({required this.context});

  @override
  List<Object?> get props => [context];
}