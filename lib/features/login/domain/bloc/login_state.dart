import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginState extends Equatable {}

class LoginInitState extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginSubmitState extends LoginState {
  final bool isLoader;
  final bool isPassword;
  final TextEditingController bpNumberTextFiledController;
  final TextEditingController passwordTextFieldController;

  LoginSubmitState(
      {required this.isLoader,
      required this.isPassword,
      required this.bpNumberTextFiledController,
      required this.passwordTextFieldController});

  @override
  // TODO: implement props
  List<Object?> get props => [
        isLoader,
        isPassword,
        bpNumberTextFiledController,
        passwordTextFieldController
      ];
}
