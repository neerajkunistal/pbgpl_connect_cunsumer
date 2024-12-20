import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/preshantation/page/dashboard.dart';
import 'package:customer_connect/features/login/domain/bloc/login_event.dart';
import 'package:customer_connect/features/login/domain/bloc/login_state.dart';
import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/features/login/helper/login_helper.dart';
import 'package:customer_connect/features/login/presentation/pages/login_page.dart';
import 'package:customer_connect/utills/commonClass/user_info.dart';
import 'package:flutter/material.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitState()) {
    on<LoginPageLoadingEvent>(_pageLoader);
    on<LoginSetBpNumberEvent>(_setBpNumber);
    on<LoginSetPasswordEvent>(_setPassword);
    on<LoginPasswordHideShowEvent>(_setHideShowPassword);
    on<LoginSubmitDataEvent>(_submitLoginData);
  }

  String bpNumber = "";
  String password = "";

  bool _isPassword = true;

  bool get isPassword => _isPassword;
  bool _isLoader = false;

  bool get isLoader => _isLoader;

  TextEditingController bpNumberTextFiledController = TextEditingController();
  TextEditingController passwordTextFieldController = TextEditingController();

  LoginModel _userData =  LoginModel();
  LoginModel get userData => _userData;

  _setBpNumber(LoginSetBpNumberEvent event, emit) {
    bpNumber = event.bpNumber;
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
    _isPassword = true;
    _isLoader = false;
    _userData =  LoginModel();
    bpNumberTextFiledController.text = "";
    passwordTextFieldController.text = "";
    _eventCompleted(emit);
  }

  _submitLoginData(LoginSubmitDataEvent event, emit) async {
    var textValidationCheck = await LoginHelper.textFieldValidation(
        bpNumber: bpNumber, password: password, context: event.context);
    if (textValidationCheck == true) {
      _isLoader = true;
      _eventCompleted(emit);
      var res = await LoginHelper.loginApiData(
          loginRequestModel: LoginRequestModel(
            bpNumber: bpNumber,
            password: password,
          ),
          context: event.context);
      _isLoader = false;
      _eventCompleted(emit);
      if (res != null) {
        _userData =  res;
        UserInfo.instance!.setUserInfo(userData);
        _eventCompleted(emit);
        await SharedPreferencesUtils.setString(key: PreferencesName.userName, value: bpNumber);
        await SharedPreferencesUtils.setString(key: PreferencesName.password, value: password);
        Navigator.pushReplacement(event.context,
            MaterialPageRoute(builder: (context) => DashboardPage()));
            // MaterialPageRoute(builder: (context) => BillAmountDashboard()));
      } else {
        if(event.isLoginPage == false){
          Navigator.pushReplacement(event.context,
              MaterialPageRoute(builder: (context) => LoginView()));
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
      bpNumberTextFiledController: bpNumberTextFiledController,
      passwordTextFieldController: passwordTextFieldController,
    ));
  }
}
