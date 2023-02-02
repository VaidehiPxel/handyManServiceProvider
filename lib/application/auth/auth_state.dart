import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class GetOtpSuccess extends AuthState {}

class GetOtpError extends AuthState {
  final String? mErrorMsg;
  const GetOtpError({this.mErrorMsg});
  @override
  List<Object> get props => [mErrorMsg!];
}

class GetOtpLoading extends AuthState {}

class GetOtpShowMessage extends AuthState {
  final String msg;
  const GetOtpShowMessage({required this.msg});
  @override
  List<Object> get props => [msg];
}

class VerifyOtpSuccess extends AuthState {}

class OtpVerifyError extends AuthState {
  final String? mErrorMsg;
  const OtpVerifyError({this.mErrorMsg});
  @override
  List<Object> get props => [mErrorMsg!];
}

class OtpVerifyLoading extends AuthState {}

class OtpVerifyMessage extends AuthState {
  final String msg;
  const OtpVerifyMessage({required this.msg});
  @override
  List<Object> get props => [msg];
}
