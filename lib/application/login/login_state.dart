import 'package:equatable/equatable.dart';

abstract class LoginScreenState extends Equatable {
  const LoginScreenState();

  @override
  List<Object> get props => [];
}

class LoginScreenInitial extends LoginScreenState {}

class LoginScreenSuccess extends LoginScreenState {}

class LoginScreenError extends LoginScreenState {
  final String? mErrorMsg;
  const LoginScreenError({this.mErrorMsg});
  @override
  List<Object> get props => [mErrorMsg!];
}

class LoginScreenLoading extends LoginScreenState {}

class LoginScreenShowMessage extends LoginScreenState {
  final String msg;
  const LoginScreenShowMessage({required this.msg});
  @override
  List<Object> get props => [msg];
}