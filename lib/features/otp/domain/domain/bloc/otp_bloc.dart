import 'package:bloc/bloc.dart';
import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/preshantation/page/dashboard.dart';
import 'package:customer_connect/features/forgetPassword/helper/forget_password_helper.dart';
import 'package:customer_connect/features/forgetPassword/presentation/page/forget_password_page.dart';
import 'package:customer_connect/features/login/domain/bloc/login_bloc.dart';
import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/features/login/helper/login_helper.dart';
import 'package:customer_connect/utills/commonClass/user_info.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_error_widget.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  bool isLoader =  false;
  String mobileNumber = "";
  String schema = "";
  bool isResendOtp =  false;
  String timer = "";
  List<TextEditingController> controls = [];
  String _otp = "";
  String get otp => _otp;
  bool clearText =  false;
  bool isForgetPasswordPage =  false;

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _isNewPasswordVisibility = true;
  bool get isNewPasswordVisibility => _isNewPasswordVisibility;
  bool _isConfirmPasswordVisibility = true;
  bool get isConfirmPasswordVisibility => _isConfirmPasswordVisibility;

  OtpBloc() : super(OtpInitial()) {
    on<OtpPageLoadEvent>(_pageLoad);
    on<OtpUpdateTimeEvent>(_updateTime);
    on<OtpResendEvent>(_resendOtp);
    on<OtpValueEvent>(_otpValue);
    on<NewPasswordVisibility>(_newPasswordVisibility);
    on<ConfirmPasswordVisibility>(_confirmPasswordVisibility);
    on<OtpSubmitEvent>(_submit);
  }

  _pageLoad(OtpPageLoadEvent event, emit) async {
    emit(OtpPageLoadState());
    isLoader =  false;
    isResendOtp =  false;
    mobileNumber = "";
    controls = [];
    clearText =  false;
    _otp = "";
    _isConfirmPasswordVisibility = true;
    _isNewPasswordVisibility = true;
    newPasswordController.text = "";
    confirmPasswordController.text = "";

    schema =  BlocProvider.of<LoginBloc>(event.context).schema;
    mobileNumber =  BlocProvider.of<LoginBloc>(event.context).bpNumber;
    isForgetPasswordPage =  BlocProvider.of<LoginBloc>(event.context).isForgetPasswordPage;
    _eventComplete(emit);
  }


  _updateTime(OtpUpdateTimeEvent event, emit) {
    if(event.count == 0){
      timer = "";
    } else {
      if(event.count.toString().length == 1){
        String value = "00:0${event.count}";
        timer =  value;
      } else {
        String value = "00:${event.count}";
        timer =  value;
      }
    }
    _eventComplete(emit);
  }

  _resendOtp(OtpResendEvent event, emit) async {
    isResendOtp =  true;
    isLoader =  false;
    clearText =   true;
    _eventComplete(emit);
    if(isForgetPasswordPage == false) {
      await LoginHelper.sendOtp(mobileNumber: mobileNumber, schema: schema, context: event.context);
    } else if (isForgetPasswordPage == true){
      await LoginHelper.forgetPassword(bpNumber: mobileNumber, context: event.context);
    }

    isResendOtp =  false;
    isLoader =  false;
    clearText =   false;
    _eventComplete(emit);
  }

  _otpValue(OtpValueEvent event, emit) {
    _otp =  event.otpValue.toString();
  }

  _newPasswordVisibility(NewPasswordVisibility event, emit) {
    _isNewPasswordVisibility = event.isNewPasswordVisibility;
    _eventComplete(emit);
  }

  _confirmPasswordVisibility(ConfirmPasswordVisibility event, emit) {
    _isConfirmPasswordVisibility = event.isConfirmPasswordVisibility;
    _eventComplete(emit);
  }

  _submit(OtpSubmitEvent event, emit) async {

    if(otp.toString().length != 6){
      SnackBarErrorWidget(!event.context.mounted ? event.context : event.context)
          .show(message: "Please enter correct otp");
      return;
    }

    isResendOtp =  false;
    isLoader =  true;
    _eventComplete(emit);

    if(isForgetPasswordPage == false) {
      var res = await LoginHelper.loginApiData(
          loginRequestModel: LoginRequestModel(
              bpNumber: mobileNumber,
              password: "",
              schema: schema,
              otp: otp.toString()
          ),
          context: event.context);
      if(res != null) {
        UserInfo.instanceInit()!.setUserList(res);
        await SharedPreferencesUtils.setString(key: PreferencesName.userName, value: mobileNumber);
        await SharedPreferencesUtils.setString(key: PreferencesName.password, value: "");
        Navigator.pushReplacement(event.context,
            MaterialPageRoute(builder: (context) => DashboardPage()));
      }
    } else if (isForgetPasswordPage == true) {
      var textFiledValidationCheck =
      await ForgetPasswordHelper.textFieldValidation(
          newPassword: newPasswordController.text.toString(),
          confirmPassword: confirmPasswordController.text.toString(),
          context: event.context);
      if (textFiledValidationCheck == true) {
        var res = await ForgetPasswordHelper.submit(
            schema: schema,
            bpNumber: mobileNumber,
            otp: otp,
            newPassword: newPasswordController.text.toString(),
            confirmPassword: confirmPasswordController.text.toString(),
            context: !event.context.mounted ? event.context : event.context);
        if(res != null) {
          newPasswordController.text = "";
          confirmPasswordController.text = "";
          Navigator.of(event.context).pop();
        }
      }
    }
    isResendOtp =  false;
    isLoader =  false;
    _eventComplete(emit);
  }

  _eventComplete(Emitter<OtpState> emit) {
    emit(FetchOtpDataState(isLoader: isLoader,
        mobileNumber: mobileNumber,
        clearText: clearText,
       isResendOtp: isResendOtp,
       timer: timer,
       controls: controls,
        newPasswordController: newPasswordController,
        confirmPasswordController: confirmPasswordController,
        isConfirmPasswordVisibility: isConfirmPasswordVisibility,
        isNewPasswordVisibility: isNewPasswordVisibility,
        isForgetPasswordPage: isForgetPasswordPage,
    ));
  }
}
