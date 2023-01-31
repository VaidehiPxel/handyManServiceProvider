part of 'terms_bloc.dart';


abstract class TermsConditionState extends Equatable {
  final bool isLoading;
  const TermsConditionState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

class TermsConditionInitial extends TermsConditionState {
  const TermsConditionInitial({required super.isLoading});
}

class TermsConditionError extends TermsConditionState {
  final String? mErrorMsg;
  const TermsConditionError({this.mErrorMsg, required super.isLoading});
  @override
  List<Object> get props => [mErrorMsg!];
}

class TermsConditionSuccess extends TermsConditionState {
  final String mTermsConditions;
  const TermsConditionSuccess(
      {required this.mTermsConditions, required super.isLoading});
  @override
  List<Object> get props => [mTermsConditions];
}