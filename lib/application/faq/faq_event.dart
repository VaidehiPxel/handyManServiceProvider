part of 'faq_bloc.dart';

abstract class FaqEvent extends Equatable {
  const FaqEvent();

  @override
  List<Object> get props => [];
}

class FaqCallApiEvent extends FaqEvent {
  const FaqCallApiEvent();

  @override
  List<Object> get props => [];
}

class FaqSuccessEvent extends FaqEvent {
  final List<FaqModel> mFaqModel;
  const FaqSuccessEvent({required this.mFaqModel});

  @override
  List<Object> get props => [mFaqModel];
}