import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_projects/model/faq/faq_model.dart';
import 'package:flutter_projects/services/faq_services.dart';

part 'faq_event.dart';
part 'faq_state.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  final FaqService faqService;

  FaqBloc({required this.faqService}) : super(FaqInitial(isLoading: true)) {
    on<FaqEvent>((event, emit) async {
      if (event is FaqCallApiEvent) {
        await faqService.getFaqs(
          errorCallBack: (appError) {},
          faqSuccess: (faq) {
            print(faq.length);
            emit(FaqSuccess(mFaqModel: faq, isLoading: false));
          },
        );
      }
    });
  }
}