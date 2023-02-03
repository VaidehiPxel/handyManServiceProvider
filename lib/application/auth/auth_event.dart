import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class GetOTPCallApiEvent extends AuthEvent {
  final String mobileNo;
  const GetOTPCallApiEvent({required this.mobileNo});

  @override
  List<Object> get props => [mobileNo];
}

class OtpVerifyApiEvent extends AuthEvent {
  final String mobileNo;
  final String otp;
  const OtpVerifyApiEvent({required this.mobileNo, required this.otp});

  @override
  List<Object> get props => [mobileNo, otp];
}

class SetPasswordApiEvent extends AuthEvent {
  final String mobileNo;
  final String password;
  final String confirmPassword;
  const SetPasswordApiEvent(
      {required this.mobileNo,
      required this.password,
      required this.confirmPassword});

  @override
  List<Object> get props => [mobileNo, password, confirmPassword];
}
