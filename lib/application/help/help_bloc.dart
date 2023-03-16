import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/application/help/help_event.dart';
import 'package:flutter_projects/application/help/help_state.dart';
import 'package:flutter_projects/services/help_service.dart';
import 'package:flutter_projects/services/login_services.dart';
import '/application/login/login_event.dart';
import '/application/login/login_state.dart';

class HelpBloc extends Bloc<HelpEvent, HelpState> {
  HelpService helpService;
  HelpBloc({required this.helpService}) : super(HelpInitial()) {
    on<HelpEvent>((event, emit) async {
      if (event is HelpSubmitCallApiEvent) {
        emit(HelpLoading());
        await helpService.submitHelp(
          firstName: event.firstName,
          lastName:event.lastName ,
          email: event.email,
          mobilenumber: event.mobile,
          description: event.message,
          errorCallBack: (appError) {
            emit(HelpError(mErrorMsg: appError));
          },
          helpSuccess: (isSuccess, msg) {
            if (isSuccess) {
              emit(HelpSuccess());
            } else {
              emit(HelpShowMessage(msg: msg));
            }
          },
        );
      }
    });
  }
}
