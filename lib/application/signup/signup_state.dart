import 'package:equatable/equatable.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupStateInitial extends SignupState {}

class SignupStateError extends SignupState {
  final String? mErrorMsg;
  const SignupStateError({this.mErrorMsg});
  @override
  List<Object> get props => [mErrorMsg!];
}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {}

class SignupShowMessage extends SignupState {
  final String msg;
  const SignupShowMessage({required this.msg});
  @override
  List<Object> get props => [msg];
}