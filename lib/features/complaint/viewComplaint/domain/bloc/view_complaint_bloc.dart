import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'view_complaint_event.dart';
part 'view_complaint_state.dart';

class ViewComplaintBloc extends Bloc<ViewComplaintEvent, ViewComplaintState> {

  List<dynamic> complaintList = [];

  ViewComplaintBloc() : super(ViewComplaintInitial()) {
    on<ViewComplaintPageLoadEvent>(_pageLoad);
  }

  _pageLoad(ViewComplaintPageLoadEvent event, emit) async {
    emit(ViewComplaintPageLoadState());
    complaintList = [];
    _eventComplete(emit);
  }

  _eventComplete(Emitter<ViewComplaintState>emit) {
    emit(FetchViewComplaintDataState(
      complaintList: complaintList,
    ));
  }

}
