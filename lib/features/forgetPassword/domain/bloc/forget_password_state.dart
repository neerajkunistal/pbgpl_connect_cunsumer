part of 'forget_password_bloc.dart';

sealed class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();
}

final class ForgetPasswordInitial extends ForgetPasswordState {
  @override
  List<Object> get props => [];
}
// ForgetPasswordLoadingState

final class ForgetPasswordLoadingState extends ForgetPasswordInitial {
  @override
  List<Object> get props => [];
}

final class FetchForgetPasswordDataState extends ForgetPasswordInitial {
  final bool isLoader;
  final TextEditingController oldPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;
  final bool isOldPasswordVisibility;
  final bool isNewPasswordVisibility;
  final bool isConfirmPasswordVisibility;

  FetchForgetPasswordDataState(
      {required this.isLoader,
        required this.oldPasswordController,
        required this.newPasswordController,
        required this.confirmPasswordController,
        required this.isOldPasswordVisibility,
        required this.isConfirmPasswordVisibility,
        required this.isNewPasswordVisibility});

  @override
  List<Object> get props => [
    isLoader,
    oldPasswordController,
    newPasswordController,
    confirmPasswordController,
    isOldPasswordVisibility,
    isNewPasswordVisibility,
    isConfirmPasswordVisibility
  ];
}