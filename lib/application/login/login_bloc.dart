import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/services/login_services.dart';
import '/application/login/login_event.dart';
import '/application/login/login_state.dart';

class LoginBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginService loginService;
  LoginBloc({required this.loginService}) : super(LoginScreenInitial()) {
    on<LoginScreenEvent>((event, emit) async {
      if (event is LoginScreenCallApiEvent) {
        emit(LoginScreenLoading());
        print(event.username);
        var d = await loginService.login(
          username: event.username,
          password: event.password,
          isMobile: event.isMobile,
          errorCallBack: (appError) {
            emit(LoginScreenError(mErrorMsg: appError));
          },
          loginSuccess: (isSuccess, msg) {
            if (isSuccess) {
              emit(LoginScreenSuccess());
            } else {
              emit(LoginScreenShowMessage(msg: msg));
            }
          },
        );
      }
    });
  }
}