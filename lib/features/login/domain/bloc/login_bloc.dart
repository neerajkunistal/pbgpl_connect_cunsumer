import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/preshantation/page/dashboard.dart';
import 'package:customer_connect/features/login/domain/bloc/login_event.dart';
import 'package:customer_connect/features/login/domain/bloc/login_state.dart';
import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/features/login/helper/login_helper.dart';
import 'package:customer_connect/features/login/presentation/pages/login_page.dart';
import 'package:customer_connect/features/otp/domain/domain/bloc/otp_bloc.dart';
import 'package:customer_connect/features/otp/presentation/page/otp_page.dart';
import 'package:customer_connect/utills/commonClass/fade_route.dart';
import 'package:customer_connect/utills/commonClass/user_info.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_error_widget.dart';
import 'package:customer_connect/utills/res/enums.dart';
import 'package:flutter/material.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitState()) {
    on<LoginPageLoadingEvent>(_pageLoader);
    on<LoginSetBpNumberEvent>(_setBpNumber);
    on<LoginForgetPasswordEvent>(_forgetPassword);
    on<LoginSetPasswordEvent>(_setPassword);
    on<LoginPasswordHideShowEvent>(_setHideShowPassword);
    on<LoginSubmitDataEvent>(_submitLoginData);
  }

  String bpNumber = "";
  String password = "";

  bool _isPassword = true;
  bool get isPassword => _isPassword;

  bool _isPasswordField = true;
  bool get isPasswordField => _isPasswordField;

  bool _isLoader = false;
  bool get isLoader => _isLoader;

  TextEditingController bpNumberTextFiledController = TextEditingController();
  TextEditingController passwordTextFieldController = TextEditingController();

  List<LoginModel> _userDataList =  [];
  List<LoginModel> get userDataList => _userDataList;

  String _schema = "";
  String get schema => _schema;

  bool _isForgetPasswordLoader =  false;
  bool get isForgetPasswordLoader => _isForgetPasswordLoader;

  bool isForgetPasswordPage =  false;

  _setBpNumber(LoginSetBpNumberEvent event, emit) async {
    bpNumber = event.bpNumber;
    isForgetPasswordPage =  false;
    var mobileValidation =  await LoginHelper.validateMobile(bpNumber);
    if(mobileValidation.isEmpty && event.isLoginPage == true){
      _isPasswordField =  true;
      _isLoader = true;
      _eventCompleted(emit);
      var res =  await LoginHelper.checkMobileNumber(mobileNumber: bpNumber,
          context: !event.context.mounted ? event.context :event.context);
      if(res != null){
        _schema =  res.toString();
        _isLoader = false;
        _eventCompleted(emit);
        BlocProvider.of<OtpBloc>(event.context).add(
            OtpPageLoadEvent(context: event.context,
                otpPageConfig: OtpPageConfig.login, schema: schema, mobileNumber: bpNumber, bpNumber: bpNumber));
        Navigator.push(
          !event.context.mounted ? event.context : event.context,
          FadeRoute(
              page: const OtpPage()),
        );
      } else {
        _isPasswordField =  false;
      }
    } else {
      _isPasswordField =  false;
    }
    _isLoader = false;
    _eventCompleted(emit);
  }

  _forgetPassword(LoginForgetPasswordEvent event, emit) async {
     if(bpNumber.isEmpty){
       SnackBarErrorWidget(event.context).show(message: "Please enter bp number");
       return;
     }

     _isForgetPasswordLoader =  true;
     isForgetPasswordPage =  true;
     _eventCompleted(emit);
     var res =  await LoginHelper.forgetPassword(bpNumber: bpNumber, context: event.context);
     if(res != null){
       _schema =  res["schema"];
       String mobileNumber =  res["mobile"];
       BlocProvider.of<OtpBloc>(event.context).add(
           OtpPageLoadEvent(context: event.context,
               otpPageConfig: OtpPageConfig.forgetPassword, schema: schema, mobileNumber: mobileNumber, bpNumber : bpNumber));
       Navigator.push(
           !event.context.mounted ? event.context : event.context,
           FadeRoute(
               page: const OtpPage()));
     }
     _isForgetPasswordLoader =  false;
     _eventCompleted(emit);

  }

  _setPassword(LoginSetPasswordEvent event, emit) {
    password = event.password;
  }

  _setHideShowPassword(LoginPasswordHideShowEvent event, emit) {
    _isPassword = event.isPassword;
  }

  _pageLoader(LoginPageLoadingEvent event, emit) {
    bpNumber = "";
    password = "";
    _schema = "";
    _isPassword = true;
    _isLoader = false;
    _isPasswordField = true;
    _isForgetPasswordLoader =  false;
    isForgetPasswordPage =  false;
    _userDataList =  [];
    bpNumberTextFiledController.text = "";
    passwordTextFieldController.text = "";
    _eventCompleted(emit);
  }

  _submitLoginData(LoginSubmitDataEvent event, emit) async {
    _isLoader = true;
    isForgetPasswordPage =  false;
    _eventCompleted(emit);
    var mobileValidation =  await LoginHelper.validateMobile(bpNumber);
    if(mobileValidation.isEmpty && password.isEmpty){
      var res =  await LoginHelper.checkMobileNumber(mobileNumber: bpNumber,
          context: !event.context.mounted ? event.context :event.context);
      if(res != null){
        _schema =  res.toString();
        _isLoader = false;
        _eventCompleted(emit);
        BlocProvider.of<OtpBloc>(event.context).add(
            OtpPageLoadEvent(context: event.context,
                otpPageConfig: OtpPageConfig.login, schema: schema, mobileNumber: bpNumber, bpNumber: bpNumber));
        Navigator.push(
          !event.context.mounted ? event.context : event.context,
          FadeRoute(
              page: const OtpPage()),
        );
        return;
      } else if(event.isLoginPage == false) {
        Navigator.pushAndRemoveUntil(
            !event.context.mounted ? event.context : event.context,
            MaterialPageRoute(builder: (_) => LoginView()),
                (route) => false);
        return;
      }
    }

    _isLoader = false;
    _eventCompleted(emit);
     var textValidationCheck = await LoginHelper.textFieldValidation(
        bpNumber: bpNumber, password: password, context: event.context);
    if (textValidationCheck == true) {
      _isLoader = true;
      _eventCompleted(emit);
      var res = await LoginHelper.loginApiData(
          loginRequestModel: LoginRequestModel(
            bpNumber: bpNumber,
            password: password,
            schema: "",
            otp: ""
          ),
          context: event.context);
      _isLoader = false;
      _eventCompleted(emit);
      if (res != null) {
        _eventCompleted(emit);
        UserInfo.instanceInit()!.setUserList(res);
        await SharedPreferencesUtils.setString(key: PreferencesName.userName, value: bpNumber);
        await SharedPreferencesUtils.setString(key: PreferencesName.password, value: password);
        Navigator.pushAndRemoveUntil(
            !event.context.mounted ? event.context : event.context,
            MaterialPageRoute(builder: (_) => const DashboardPage()),
                (route) => false);
      } else {
        if(event.isLoginPage == false){
          Navigator.pushAndRemoveUntil(
              !event.context.mounted ? event.context : event.context,
              MaterialPageRoute(builder: (_) => LoginView()),
                  (route) => false);
        }
        print("Not Data Here");
        return null;
      }
    }

  }

  _eventCompleted(Emitter<LoginState> emit) {
    emit(LoginSubmitState(
      isLoader: isLoader,
      isPassword: isPassword,
      isPasswordField: isPasswordField,
      isForgetPasswordLoader: isForgetPasswordLoader,
      bpNumberTextFiledController: bpNumberTextFiledController,
      passwordTextFieldController: passwordTextFieldController,
    ));
  }
}
