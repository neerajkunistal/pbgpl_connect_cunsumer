part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class DashboardUserPageLoadEvent extends DashboardEvent {
  final BuildContext context;
  const DashboardUserPageLoadEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

final class DashboardSelectUserEvent extends DashboardEvent {
  final LoginModel userData;
  final BuildContext context;
  DashboardSelectUserEvent({required this.userData, required this.context});
  @override
  List<Object> get props => [userData, context];
}

class DashboardPageLoadEvent extends DashboardEvent {
  final BuildContext context;
  const DashboardPageLoadEvent({required this.context});
  @override
  List<Object?> get props => [context];
}