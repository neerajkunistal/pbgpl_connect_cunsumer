import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable{}

class LoginPageLoadingEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}
class LoginSetBpNumberEvent extends LoginEvent{
  final String bpNumber;
  LoginSetBpNumberEvent({required this.bpNumber});
  @override
  // TODO: implement props
  List<Object?> get props => [bpNumber];
}

class LoginSetPasswordEvent extends LoginEvent{
  final String password;
  LoginSetPasswordEvent({required this.password});
  @override
  // TODO: implement props
  List<Object?> get props => [password];
}

class LoginPasswordHideShowEvent extends LoginEvent {
  final bool isPassword;
  LoginPasswordHideShowEvent({required this.isPassword});
  @override
  List<Object?> get props => [isPassword];
}

class LoginSubmitDataEvent extends LoginEvent{
  final BuildContext context;
  final bool isLoginPage;
  LoginSubmitDataEvent({required this.context, required this.isLoginPage});
  @override
  // TODO: implement props
  List<Object?> get props => [context, isLoginPage];
}
