part of 'forget_password_bloc.dart';

sealed class ForgetPasswordEvent extends Equatable {
  const ForgetPasswordEvent();
}

class ForgetPasswordPageLoadEvent extends ForgetPasswordEvent {
  final BuildContext context;
  ForgetPasswordPageLoadEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class NewPasswordVisibility extends ForgetPasswordEvent {
  final bool isNewPasswordVisibility;
  NewPasswordVisibility({required this.isNewPasswordVisibility});
  @override
  List<Object?> get props => [isNewPasswordVisibility];
}

class ConfirmPasswordVisibility extends ForgetPasswordEvent {
  final bool isConfirmPasswordVisibility;
  ConfirmPasswordVisibility({required this.isConfirmPasswordVisibility});

  @override
  List<Object?> get props => [isConfirmPasswordVisibility];
}

class PasswordSubmitEvent extends ForgetPasswordEvent {
  final BuildContext context;
  PasswordSubmitEvent({required this.context});
  @override
  List<Object?> get props => [context];
}