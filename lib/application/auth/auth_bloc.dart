import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/application/auth/auth_event.dart';
import 'package:flutter_projects/application/auth/auth_state.dart';
import 'package:flutter_projects/services/auth_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthService authService;
  AuthBloc({required this.authService}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is GetOTPCallApiEvent) {
        emit(GetOtpLoading());
        await authService.getOTP(
          mobileNo: event.mobileNo,
          errorCallBack: (appError) {
            emit(GetOtpError(mErrorMsg: appError));
          },
          getOTPSuccess: (isSuccess, msg) {
            if (isSuccess) {
              emit(GetOtpSuccess());
            } else {
              emit(GetOtpShowMessage(msg: msg));
            }
          },
        );
      } else if (event is OtpVerifyApiEvent) {
        emit(OtpVerifyLoading());
        await authService.verifyOtp(
          mobileNo: event.mobileNo,
          otp: event.otp,
          errorCallBack: (appError) {
            emit(OtpVerifyError(mErrorMsg: appError));
          },
          verifyOtpSuccess: (isSuccess, msg) {
            if (isSuccess) {
              emit(VerifyOtpSuccess());
            } else {
              emit(OtpVerifyMessage(msg: msg));
            }
          },
        );
      } else if (event is SetPasswordApiEvent) {
        emit(OtpVerifyLoading());
        await authService.setPassword(
          mobileNo: event.mobileNo,
          password: event.password,
          confirmpassword: event.confirmPassword,
          errorCallBack: (appError) {
            emit(SetPasswordError(mErrorMsg: appError));
          },
          setPasswordSuccess: (isSuccess, msg) {
            if (isSuccess) {
              emit(SetPasswordSuccess());
            } else {
              emit(SetPasswordShowMessage(msg: msg));
            }
          },
        );
      }
    });
  }
}
