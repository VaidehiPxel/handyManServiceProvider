import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/services/signup_services.dart';
import '/application/signup/signup_event.dart';
import '/application/signup/signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignUpService signUpService;
  SignupBloc({required this.signUpService}) : super(SignupStateInitial()) {
    on<SignupEvent>((event, emit) async {
      if (event is SignupCallApiEvent) {
        emit(SignupLoading());
        await signUpService.singUp(
          firstName:event.firstName ,
          lastName:event.lastName ,
          mobileNo: event.mobileNo,
          email: event.email,
          password: event.password,
          confirmPassword: event.confirmPassword,
          errorCallBack: (appError) {
            emit(SignupStateError(mErrorMsg: appError));
          },
          signUpSuccess: (isSuccess, msg) {
            if (isSuccess) {
              emit(SignupSuccess());
            } else {
              emit(SignupShowMessage(msg: msg));
            }
          },
        );
      }
    });
  }
}