part of 'view_maintenance_bloc.dart';

sealed class ViewMaintenanceState extends Equatable {
  const ViewMaintenanceState();
}

final class ViewMaintenanceInitial extends ViewMaintenanceState {
  @override
  List<Object> get props => [];
}
