part of 'dashboard_bloc.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();
}

final class DashboardInitial extends DashboardState {
  @override
  List<Object> get props => [];
}

final class DashboardPageLoadState extends DashboardInitial {
  @override
  List<Object> get props => [];
}

final class DashboardUsersPageState extends DashboardInitial {
  final List<LoginModel> userList;
  DashboardUsersPageState({required this.userList});
  @override
  List<Object> get props => [userList];
}


final class FetchDashboardDataState extends DashboardInitial {
  final List<Widget> widgetList;
  final String userName;
  final String bpNumber;
  final String cnrNumber;
  final String mobileNumber;
  final String address;
  final bool isAmountLoader;
  final BPNumberModel bpNumberData;
  final List<LoginModel> userList;
  final LoginModel userData;

  FetchDashboardDataState({
    required this.widgetList,
    required this.userName,
    required this.address,
    required this.bpNumber,
    required this.cnrNumber,
    required this.mobileNumber,
    required this.isAmountLoader,
    required this.bpNumberData,
    required this.userList,
    required this.userData,
  });

  @override
  List<Object> get props => [
    widgetList,
    userName,
    address,
    bpNumber,
    cnrNumber,
    mobileNumber,
    isAmountLoader,
    bpNumberData,
    userList,
    userData,
  ];
}