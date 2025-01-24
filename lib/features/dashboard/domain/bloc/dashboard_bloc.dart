import 'package:bloc/bloc.dart';
import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/model/bp_number_model.dart';
import 'package:customer_connect/features/dashboard/helper/dashboard_helper.dart';
import 'package:customer_connect/features/dashboard/preshantation/widgets/banner_widget.dart';
import 'package:customer_connect/features/dashboard/preshantation/widgets/bill_info_widget.dart';
import 'package:customer_connect/features/dashboard/preshantation/widgets/connection_info_widget.dart';
import 'package:customer_connect/features/dashboard/preshantation/widgets/quick_access_widget.dart';
import 'package:customer_connect/features/dashboard/preshantation/widgets/registration_info_widget.dart';
import 'package:customer_connect/features/dashboard/preshantation/widgets/transactions_list_Widget.dart';
import 'package:customer_connect/features/login/domain/bloc/login_bloc.dart';
import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/utills/commonClass/user_info.dart';
import 'package:customer_connect/utills/global_constant.dart';
import 'package:customer_connect/utills/res/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {

  List<Widget> widgetList = [];
  String billingAmount = "0.0";
  String userName = "";
  String bpNumber = "";
  String cnrNumber = "";
  String mobileNumber = "";
  String address = "";
  String schema = "";
  bool isAmountLoader =  false;

  LoginModel _userData =  LoginModel();
  LoginModel get userData => _userData;

  List<LoginModel> _userList = [];
  List<LoginModel> get userList => _userList;

  BPNumberModel _bpNumberData =  BPNumberModel();
  BPNumberModel get bpNumberData =>  _bpNumberData;

  bool isBpNumberEmpty =  false;

  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardUserPageLoadEvent>(_userPageLoad);
    on<DashboardSelectUserEvent>(_selectUser);
    on<DashboardPageLoadEvent>(_pageLoad);
  }

  _userPageLoad(DashboardUserPageLoadEvent event, emit) async {
    emit(DashboardPageLoadState());
    _userList = UserInfo.instanceInit()!.userList!;
    emit(DashboardUsersPageState(userList: userList));
  }

  _selectUser(DashboardSelectUserEvent event, emit) {
    _userData =  event.userData;
    UserInfo.instanceInit()!.setUserInfo(userData);
  }

  _pageLoad(DashboardPageLoadEvent event, emit) async {
    emit(DashboardPageLoadState());
     widgetList = [];
     isAmountLoader =  false;
     isBpNumberEmpty =  false;
     _userData =  LoginModel();

     _userData =  UserInfo.instanceInit()!.userData!;
     if(userData.bpNumber.toString().isEmpty){
       _userData.bpNumber =  userData.trNumber.toString();
       isBpNumberEmpty =  true;
     }

     userName = userData.name.toString();
     bpNumber = userData.bpNumber.toString();
     mobileNumber = userData.mobileNumber.toString();
     address = userData.address.toString();
     cnrNumber = userData.crn.toString();
     schema = userData.schema.toString();
     _bpNumberData =  BPNumberModel();


    var bpNumberDataRes =  await DashboardHelper.fetchBpNumberData(schema: schema,
        bpNumber: bpNumber, context: event.context);
    if(bpNumberDataRes != null){
      _bpNumberData =  bpNumberDataRes;
    }

    widgetList.add(BannerWidget());
    widgetList.add(BillInfoWidget());
    widgetList.add(ConnectionInfoWidget());
    widgetList.add(QuickAccessWidget());
    widgetList.add(TransactionsListWidget());

     isAmountLoader =  false;
     _eventComplete(emit);
  }

  _eventComplete(Emitter<DashboardState> emit) {
    emit(FetchDashboardDataState(
        widgetList: widgetList,
        address: address,
        bpNumber: bpNumber,
        cnrNumber: cnrNumber,
        mobileNumber: mobileNumber,
        userName: userName,
        isAmountLoader: isAmountLoader,
        bpNumberData: bpNumberData,
        userList: userList,
        userData: userData,
    ));
  }
}
