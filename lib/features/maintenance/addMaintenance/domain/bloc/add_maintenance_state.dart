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
  final List<DisconnectionTypeModel> disconnectionTypeList;
  final List<DisconnectionReasonType> disconnectionReasonTypeList;
  final DisconnectionTypeModel disconnectionTypeData;
  final DisconnectionReasonType disconnectionReasonTypeData;
  final TextEditingController bpNumberController;
  final TextEditingController requestDateController;
  final TextEditingController disconnectionRequestController;
  final TextEditingController disconnectionReasonController;
  final File file;

  FetchAddMaintenanceDataState({
    required this.isLoader,
    required this.file,
    required this.bpNumberController,
    required this.disconnectionReasonController,
    required this.disconnectionReasonTypeData,
    required this.disconnectionReasonTypeList,
    required this.disconnectionRequestController,
    required this.disconnectionTypeData,
    required this.disconnectionTypeList,
    required this.requestDateController,
});

  @override
  List<Object> get props => [
    isLoader,
    file,
    bpNumberController,
    disconnectionReasonController,
    disconnectionReasonTypeData,
    disconnectionReasonTypeList,
    disconnectionRequestController,
    disconnectionTypeData,
    disconnectionTypeList,
    requestDateController,
  ];
}