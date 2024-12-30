part of 'add_connection_bloc.dart';

sealed class AddConnectionState extends Equatable {
  const AddConnectionState();
}

final class AddConnectionInitial extends AddConnectionState {
  @override
  List<Object> get props => [];
}

final class AddConnectionPageLoadState extends AddConnectionInitial {
  @override
  List<Object> get props => [];
}

final class FetchAddConnectionDataState extends AddConnectionInitial {
  final bool isLoader;
  FetchAddConnectionDataState({required this.isLoader});
  @override
  List<Object> get props => [isLoader];
}