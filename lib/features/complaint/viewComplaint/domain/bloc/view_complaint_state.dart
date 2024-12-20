part of 'view_complaint_bloc.dart';

sealed class ViewComplaintState extends Equatable {
  const ViewComplaintState();
}

final class ViewComplaintInitial extends ViewComplaintState {
  @override
  List<Object> get props => [];
}

final class ViewComplaintPageLoadState extends ViewComplaintInitial {
  @override
  List<Object> get props => [];
}

final class FetchViewComplaintDataState extends ViewComplaintInitial {
  final List<dynamic> complaintList;

  FetchViewComplaintDataState({required this.complaintList});

  @override
  List<Object> get props => [complaintList];
}