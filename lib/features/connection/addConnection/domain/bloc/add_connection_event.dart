part of 'add_connection_bloc.dart';

sealed class AddConnectionEvent extends Equatable {
  const AddConnectionEvent();
}

class AddConnectionPageLoadEvent extends AddConnectionEvent {
  final BuildContext context;
  AddConnectionPageLoadEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class AddConnectionSubmitEvent extends AddConnectionEvent {
  final BuildContext context;
  AddConnectionSubmitEvent({required this.context});
  @override
  List<Object?> get props => [context];
}