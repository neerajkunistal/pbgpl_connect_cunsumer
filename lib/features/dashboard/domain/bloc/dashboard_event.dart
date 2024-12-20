part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class DashboardPageLoadEvent extends DashboardEvent {
  final BuildContext context;
  const DashboardPageLoadEvent({required this.context});
  @override
  List<Object?> get props => [context];
}