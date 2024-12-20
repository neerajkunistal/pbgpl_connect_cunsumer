part of 'bill_request_bloc.dart';

sealed class BillRequestState extends Equatable {
  const BillRequestState();
}

final class BillRequestInitial extends BillRequestState {
  @override
  List<Object> get props => [];
}

final class BillRequestPageLoadState extends BillRequestInitial {
  @override
  List<Object> get props => [];
}

final class FetchBillRequestDataState extends BillRequestInitial {
  final bool isLoader;

  FetchBillRequestDataState({
    required this.isLoader,
  });
  @override
  List<Object> get props => [
    isLoader
  ];
}
