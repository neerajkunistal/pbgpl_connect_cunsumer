import 'package:bloc/bloc.dart';
import 'package:customer_connect/features/complaint/viewComplaint/domain/model/complaint_model.dart';
import 'package:customer_connect/features/complaint/viewComplaint/helper/view_complaint_helper.dart';
import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/utills/commonClass/user_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'view_complaint_event.dart';
part 'view_complaint_state.dart';

class ViewComplaintBloc extends Bloc<ViewComplaintEvent, ViewComplaintState> {

  List<ComplaintModel>  _complaintList = [];
  List<ComplaintModel>  get complaintList => _complaintList;

  LoginModel  _userData =  LoginModel();
  LoginModel  get userData => _userData;

  ViewComplaintBloc() : super(ViewComplaintInitial()) {
    on<ViewComplaintPageLoadEvent>(_pageLoad);
  }

  _pageLoad(ViewComplaintPageLoadEvent event, emit) async {
    emit(ViewComplaintPageLoadState());
    _complaintList = [];
    _userData =  UserInfo.instanceInit()!.userData!;
    var res =  await ViewComplaintHelper.fetchComplaintData(
        schema: userData.schema.toString(),
        dmaId: userData.dmaId.toString());
    if(res != null){
      _complaintList =  res;
    }
    _eventComplete(emit);
  }

  _eventComplete(Emitter<ViewComplaintState>emit) {
    emit(FetchViewComplaintDataState(
      complaintList: complaintList,
    ));
  }

}
