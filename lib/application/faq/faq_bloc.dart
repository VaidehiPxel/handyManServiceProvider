import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_projects/model/faq/faq_model.dart';
import 'package:flutter_projects/services/faq_services.dart';

part 'faq_event.dart';
part 'faq_state.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  final FaqService faqService;

  FaqBloc({required this.faqService})
      : super(const FaqInitial(isLoading: true)) {
    on<FaqEvent>((event, emit) async {
      if (event is FaqCallApiEvent) {
        await faqService.getFaqs(
          errorCallBack: (appError) {},
          faqSuccess: (faq) {
            emit(FaqSuccess(mFaqModel: faq, isLoading: false));
          },
        );
      }
    });
  }
}
