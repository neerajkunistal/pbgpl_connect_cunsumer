part of 'otp_bloc.dart';

sealed class OtpEvent extends Equatable {
  const OtpEvent();
}

class OtpPageLoadEvent extends OtpEvent {
  final BuildContext context;
  final OtpPageConfig otpPageConfig;
  final String mobileNumber;
  final String schema;

  OtpPageLoadEvent({required this.context,
  required this.otpPageConfig,
  required this.mobileNumber,
  required this.schema,
  });
  @override
  List<Object?> get props => [context, otpPageConfig, mobileNumber, schema];
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
