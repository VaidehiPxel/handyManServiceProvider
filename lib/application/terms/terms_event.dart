part of 'terms_bloc.dart';


abstract class TermsConditionEvent extends Equatable {
  const TermsConditionEvent();

  @override
  List<Object> get props => [];
}

class TermsConditionCallApiEvent extends TermsConditionEvent {
  const TermsConditionCallApiEvent();

  @override
  List<Object> get props => [];
}

class TermsConditionSuccessEvent extends TermsConditionEvent {
  final String mTAndC;
  const TermsConditionSuccessEvent({required this.mTAndC});

  @override
  List<Object> get props => [mTAndC];
}