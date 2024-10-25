import 'package:customer_connect/Views/dashboard.dart';
import 'package:customer_connect/features/login/domain/bloc/login_event.dart';
import 'package:customer_connect/features/login/domain/bloc/login_state.dart';
import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/features/login/helper/login_helper.dart';
import 'package:customer_connect/utills/common_widget/custom_toast.dart';
import 'package:customer_connect/utills/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
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

  TextEditingController bpNumberTextFiledController =  TextEditingController();
  TextEditingController passwordTextFieldController =  TextEditingController();

  _setBpNumber(LoginSetBpNumberEvent event, emit){
    bpNumber = event.bpNumber;
  }

  _setPassword(LoginSetPasswordEvent event, emit){
    password = event.password;
  }


  _setHideShowPassword(LoginPasswordHideShowEvent event, emit){
    _isPassword = event.isPassword;
  }

  _pageLoader(LoginPageLoadingEvent event, emit){
    bpNumber = "";
    password ="";
    _isPassword = true;
    _isLoader = false;
    bpNumberTextFiledController.text = "";
    passwordTextFieldController.text = "";
    _eventCompleted(emit);
  }

  _submitLoginData(LoginSubmitDataEvent event, emit) async {
    var textValidationCheck = await LoginHelper.textFieldValidation(bpNumber: bpNumber, password: password, context: event.context);
    if(textValidationCheck == true) {
      _isLoader = false;
      _eventCompleted(emit);
      var res = await LoginHelper.loginApiData(
          loginRequestModel:LoginRequestModel(
            bpNumber:bpNumber ,
            password: password,
          ),
          context: event.context);
      _isLoader =  true;
      _eventCompleted(emit);
      if(res != null){
        _isLoader =  false;
        _eventCompleted(emit);
        CustomToast.showToast(res.messages.toString());
        print(res.messages);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(GlobalConstants.dmaId, res.user.dmaId.toString());
        prefs.setString(GlobalConstants.token, res.token.toString());
        prefs.setString(GlobalConstants.bpNumber,res.user.bpNumber.toString());
        prefs.setString(GlobalConstants.meterSerialNumber,res.user.serialNumber.toString());
        prefs.setString(GlobalConstants.crn,res.user.crn.toString());
        prefs.setString(GlobalConstants.username,res.user.name);
        prefs.setString(GlobalConstants.schema, res.user.schema);
        prefs.setString(GlobalConstants.email, res.user.email);
        prefs.setString(GlobalConstants.mobileNumber, res.user.mobileNumber);
        prefs.setString(GlobalConstants.address, res.user.address);
        prefs.setString(GlobalConstants.pinCode, res.user.pincode);
        prefs.setString(GlobalConstants.town, res.user.town);
        prefs.setString(GlobalConstants.locality, res.user.locality);
        prefs.setString(GlobalConstants.states, res.user.states);
        prefs.setString(GlobalConstants.dmaId, res.user.dmaId);
        prefs.setBool(GlobalConstants.isUserLogIn, true);
        Navigator.pushReplacement(event.context,MaterialPageRoute(builder: (context) => BillAmountDashboard()));
      } else{
        print("Not Data Here");
        return null;
      }

    }

  }


  _eventCompleted(Emitter<LoginState> emit)  {
    emit(LoginSubmitState(
      isLoader: isLoader,
      isPassword: isPassword,
      bpNumberTextFiledController: bpNumberTextFiledController,
      passwordTextFieldController: passwordTextFieldController      ,


    ));
  }

}