import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'add_connection_event.dart';
part 'add_connection_state.dart';

class AddConnectionBloc extends Bloc<AddConnectionEvent, AddConnectionState> {
  AddConnectionBloc() : super(AddConnectionInitial()) {

  }
}
