import 'package:equatable/equatable.dart';

abstract class LoginScreenEvent extends Equatable {
  const LoginScreenEvent();

  @override
  List<Object> get props => [];
}

class LoginScreenCallApiEvent extends LoginScreenEvent {
  final String username;
  final String password;
  final bool isMobile;
  const LoginScreenCallApiEvent(
      {required this.username, required this.password, required this.isMobile});

  @override
  List<Object> get props =>
      [username.toString(), password.toString(), isMobile];
}