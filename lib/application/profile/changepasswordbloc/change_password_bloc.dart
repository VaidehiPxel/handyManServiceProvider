import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_projects/services/change_password_service.dart';


part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordService changePasswordService;
  ChangePasswordBloc({required this.changePasswordService})
      : super(const ChangePasswordInitial(isLoading: false)) {
    on<ChangePasswordEvent>((event, emit) async {
      if (event is ChangePasswordCallApiEvent) {
        emit(ChangePasswordLoading(isLoading: true));

        await changePasswordService.changePassword(
          oldPassword: event.oldPassword,
          newPassword: event.newPassword,
          errorCallBack: (appError) {
            emit(ChangePasswordStateError(
                mErrorMsg: appError, isLoading: false));
          },
          changePasswordSuccess: () {
            emit(const ChangePasswordSuccess(
              isLoading: false,
            ));
          },
        );
      }
    });
  }
}
