part of 'add_maintenance_bloc.dart';

sealed class AddMaintenanceState extends Equatable {
  const AddMaintenanceState();
}

final class AddMaintenanceInitial extends AddMaintenanceState {
  @override
  List<Object> get props => [];
}

final class AddMaintenancePageLoadState extends AddMaintenanceInitial {
  @override
  List<Object> get props => [];
}

final class FetchAddMaintenanceDataState extends AddMaintenanceInitial {
  final bool isLoader;
  final List<MaintenanceServiceTypeModel> serviceTypeList;
  final MaintenanceServiceTypeModel serviceTypeData;
  final TextEditingController bpNumberController;
  final TextEditingController requestDateController;
  final TextEditingController messageController;
  final File file;
  final BPNumberModel bpNumberData;

  FetchAddMaintenanceDataState({
    required this.isLoader,
    required this.file,
    required this.bpNumberController,
    required this.messageController,
    required this.serviceTypeData,
    required this.serviceTypeList,
    required this.requestDateController,
    required this.bpNumberData,
});

  @override
  List<Object> get props => [
    isLoader,
    file,
    bpNumberController,
    messageController,
    serviceTypeData,
    serviceTypeList,
    requestDateController,
    bpNumberData,
  ];
}