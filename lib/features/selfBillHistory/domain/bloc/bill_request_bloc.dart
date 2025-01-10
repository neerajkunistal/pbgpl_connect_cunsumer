import 'package:bloc/bloc.dart';
import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:customer_connect/features/dashboard/domain/model/customer_model.dart';
import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/features/selfBillHistory/domain/model/self_bill_model.dart';
import 'package:customer_connect/features/selfBillHistory/helper/bill_request_helper.dart';
import 'package:customer_connect/features/selfBilling/helper/self_billing_helper.dart';
import 'package:customer_connect/utills/commonClass/user_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'bill_request_event.dart';
part 'bill_request_state.dart';

class BillRequestBloc extends Bloc<BillRequestEvent, BillRequestState> {

  bool isLoader =  false;

  List<SelfBillModel> _selfBillList = [];
  List<SelfBillModel> get selfBillList => _selfBillList;

  LoginModel _userData =  LoginModel();
  LoginModel get userData => _userData;

  BillRequestBloc() : super(BillRequestInitial()) {
    on<BillRequestPageLoadEvent>(_pageLoad);
  }

  _pageLoad(BillRequestPageLoadEvent event, emit) async {
    emit(BillRequestPageLoadState());
    isLoader =  false;
    _selfBillList = [];
    CustomerModel customerData =  BlocProvider.of<DashboardBloc>(event.context).bpNumberData.customerData!;
    _userData =  UserInfo.instanceInit()!.userData!;

    var res =  await BillRequestHelper.fetchSelfBillingData(
         schema: userData.schema.toString(), dmaId: customerData.id.toString());
    if(res != null){
      _selfBillList = res;
    }

    _eventComplete(emit);
  }

  _eventComplete(Emitter<BillRequestState>emit){
    emit(FetchBillRequestDataState(
        isLoader: isLoader,
        selfBillList: selfBillList,
    ));
  }
}
