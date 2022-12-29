import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/application/signup/signup_event.dart';
import 'package:flutter_projects/application/signup/signup_state.dart';


class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState()) {

    on<SignupEvent>((event, emit) async {
      
    });
  }
}