import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'view_maintenance_event.dart';
part 'view_maintenance_state.dart';

class ViewMaintenanceBloc extends Bloc<ViewMaintenanceEvent, ViewMaintenanceState> {
  ViewMaintenanceBloc() : super(ViewMaintenanceInitial()) {
    on<ViewMaintenancePageLoadEvent>(_pageLoad);
  }

  _pageLoad(ViewMaintenancePageLoadEvent event, emit) async {

  }

}
