part of 'add_disconnection_bloc.dart';

sealed class AddDisconnectionState extends Equatable {
  const AddDisconnectionState();
}

final class AddDisconnectionInitial extends AddDisconnectionState {
  @override
  List<Object> get props => [];
}

final class AddDisconnectionPageLoadState extends AddDisconnectionInitial {
  @override
  List<Object> get props => [];
}

final class FetchAddDisconnectionDataState extends AddDisconnectionInitial {
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
  final BPNumberModel bpNumberData;

  FetchAddDisconnectionDataState({
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
    required this.bpNumberData,
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
    bpNumberData,
  ];
}