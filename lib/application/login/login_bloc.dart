import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/application/login/login_event.dart';
import 'package:flutter_projects/application/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {

    on<LoginEvent>((event, emit) async {

    });
  }
}