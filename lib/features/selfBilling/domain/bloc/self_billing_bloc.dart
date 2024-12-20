import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:customer_connect/features/dashboard/helper/dashboard_helper.dart';
import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/utills/commonClass/user_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'self_billing_event.dart';
part 'self_billing_state.dart';

class SelfBillingBloc extends Bloc<SelfBillingEvent, SelfBillingState> {

  bool isLoader =  false;
  TextEditingController bpNumberController =  TextEditingController();
  TextEditingController customerNameController =  TextEditingController();
  TextEditingController customerAddressController =  TextEditingController();
  TextEditingController meterNumberController  =  TextEditingController();
  TextEditingController previousReadingController =  TextEditingController();
  File file =  File("");

  LoginModel _userData = LoginModel();
  LoginModel get userData => _userData;

  SelfBillingBloc() : super(SelfBillingInitial()) {
    on<SelfBillingPageLoadEvent>(_pageLoad);
    on<SelfBillingSelectFileEvent>(_selectFile);
    on<SelfBillingSubmitEvent>(_submit);
  }

  _pageLoad(SelfBillingPageLoadEvent event, emit) async {
    emit(SelfBillingPageLoadState());
    isLoader =  false;
    bpNumberController.text = "";
    customerNameController.text = "";
    customerAddressController.text = "";
    meterNumberController.text = "";
    previousReadingController.text = "";
    file = File("");
    _userData = UserInfo.instance!.userData!;
    bpNumberController.text =  userData.bpNumber.toString();
    _eventComplete(emit);
  }

  _selectFile(SelfBillingSelectFileEvent event, emit) async {
    int mediaType =  event.mediaType;
    if(mediaType == 1){
      var res =  await DashboardHelper.cameraPiker(context: event.context);
      if(res !=  null){
        file =  res;
        _eventComplete(emit);
      }
    } else if(mediaType == 2){
      var res =  await DashboardHelper.filePiker(context: event.context);
      if(res !=  null){
        file =  res;
        _eventComplete(emit);
      }
    }
  }

  _submit(SelfBillingSubmitEvent event, emit) async {


  }

  _eventComplete(Emitter<SelfBillingState> emit) {
    emit(FetchSelfBillingDataState(
        isLoader: isLoader,
        bpNumberController: bpNumberController,
        customerAddressController: customerAddressController,
        customerNameController: customerNameController,
        file: file,
        meterNumberController: meterNumberController,
        previousReadingController: previousReadingController,
    ));
  }
}
