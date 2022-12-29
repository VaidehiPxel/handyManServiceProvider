import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/application/auth/auth_event.dart';
import 'package:flutter_projects/application/auth/auth_state.dart';



class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {

    on<AuthEvent>((event, emit) async {
      
    });
  }
}