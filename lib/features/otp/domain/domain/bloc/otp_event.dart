part of 'otp_bloc.dart';

sealed class OtpEvent extends Equatable {
  const OtpEvent();
}

class OtpPageLoadEvent extends OtpEvent {
  final BuildContext context;
  OtpPageLoadEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class OtpResendEvent extends OtpEvent {
  final BuildContext context;
  OtpResendEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class OtpUpdateTimeEvent extends OtpEvent {
  final int count;
  OtpUpdateTimeEvent({required this.count});
  @override
  List<Object?> get props => [count];
}

class OtpValueEvent extends OtpEvent {
  final String otpValue;
  OtpValueEvent({required this.otpValue});
  @override
  List<Object?> get props => [otpValue];
}

class NewPasswordVisibility extends OtpEvent {
  final bool isNewPasswordVisibility;
  NewPasswordVisibility({required this.isNewPasswordVisibility});
  @override
  List<Object?> get props => [isNewPasswordVisibility];
}

class ConfirmPasswordVisibility extends OtpEvent {
  final bool isConfirmPasswordVisibility;
  ConfirmPasswordVisibility({required this.isConfirmPasswordVisibility});

  @override
  List<Object?> get props => [isConfirmPasswordVisibility];
}

class OtpSubmitEvent extends OtpEvent {
  final BuildContext context;
  OtpSubmitEvent({required this.context});
  @override
  List<Object?> get props => [context];
}
