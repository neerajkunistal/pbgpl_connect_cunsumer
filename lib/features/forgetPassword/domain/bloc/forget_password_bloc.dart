import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/forgetPassword/helper/forget_password_helper.dart';
import 'package:customer_connect/features/otp/domain/domain/bloc/otp_bloc.dart';
import 'package:flutter/cupertino.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  bool _isLoader = false;

  bool get isLoader => _isLoader;

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _isOldPasswordVisibility = true;

  bool get isOldPasswordVisibility => _isOldPasswordVisibility;

  bool _isNewPasswordVisibility = true;

  bool get isNewPasswordVisibility => _isNewPasswordVisibility;

  bool _isConfirmPasswordVisibility = true;

  bool get isConfirmPasswordVisibility => _isConfirmPasswordVisibility;

  String bpNumber = "";
  String schema = "";
  String otp = "";

  ForgetPasswordBloc() : super(ForgetPasswordInitial()) {
    on<ForgetPasswordPageLoadEvent>(_pageLoading);
    on<NewPasswordVisibility>(_newPasswordVisibility);
    on<ConfirmPasswordVisibility>(_confirmPasswordVisibility);
    on<PasswordSubmitEvent>(_submitPassword);
  }

  _pageLoading(ForgetPasswordPageLoadEvent event, emit) async {
    _isLoader = false;
    _isConfirmPasswordVisibility = true;
    _isOldPasswordVisibility = true;
    _isNewPasswordVisibility = true;
    oldPasswordController.text = "";
    newPasswordController.text = "";
    confirmPasswordController.text = "";
    schema =  BlocProvider.of<OtpBloc>(event.context).schema;
    bpNumber =  BlocProvider.of<OtpBloc>(event.context).mobileNumber;
    otp =  BlocProvider.of<OtpBloc>(event.context).otp;
    _eventCompleted(emit);
  }


  _newPasswordVisibility(NewPasswordVisibility event, emit) {
    _isNewPasswordVisibility = event.isNewPasswordVisibility;
    _eventCompleted(emit);
  }

  _confirmPasswordVisibility(ConfirmPasswordVisibility event, emit) {
    _isConfirmPasswordVisibility = event.isConfirmPasswordVisibility;
    _eventCompleted(emit);
  }

  _submitPassword(PasswordSubmitEvent event, emit) async {
    var textFiledValidationCheck =
    await ForgetPasswordHelper.textFieldValidation(
        newPassword: newPasswordController.text.toString(),
        confirmPassword: confirmPasswordController.text.toString(),
        context: event.context);
    if (textFiledValidationCheck == true) {
      _isLoader = true;
      _eventCompleted(emit);
      var res = await ForgetPasswordHelper.submit(
          schema: schema,
          bpNumber: bpNumber,
          otp: otp,
          newPassword: newPasswordController.text.toString(),
          confirmPassword: confirmPasswordController.text.toString(),
          context: !event.context.mounted ? event.context : event.context);
      if(res != null) {
        newPasswordController.text = "";
        confirmPasswordController.text = "";
        Navigator.of(event.context).pop();
      }
      _isLoader = false;
      _eventCompleted(emit);
    }
  }

  _eventCompleted(Emitter<ForgetPasswordState> emit) async {
    emit(FetchForgetPasswordDataState(
        isLoader: isLoader,
        newPasswordController: newPasswordController,
        confirmPasswordController: confirmPasswordController,
        isConfirmPasswordVisibility: isConfirmPasswordVisibility,
        isNewPasswordVisibility: isNewPasswordVisibility,
        oldPasswordController: oldPasswordController,
        isOldPasswordVisibility: isOldPasswordVisibility));
  }
}
