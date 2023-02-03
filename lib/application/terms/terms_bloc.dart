import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_projects/services/terms_services.dart';

part 'terms_event.dart';
part 'terms_state.dart';

class TermsConditionBloc
    extends Bloc<TermsConditionEvent, TermsConditionState> {
  final TermsConditionService termsConditionService;

  TermsConditionBloc({required this.termsConditionService})
      : super(const TermsConditionInitial(isLoading: true)) {
    on<TermsConditionEvent>((event, emit) async {
      if (event is TermsConditionCallApiEvent) {
        print("is event");
        await termsConditionService.getTAndC(
          errorCallBack: (appError) {},
          termsConditionServiceSuccess: (description) {
            print(description);
            emit(TermsConditionSuccess(
                mTermsConditions: description, isLoading: false));
          },
        );
      }
    });
  }
}
