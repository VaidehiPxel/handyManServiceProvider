part of 'faq_bloc.dart';

abstract class FaqState extends Equatable {
  final bool isLoading;
  FaqState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

class FaqInitial extends FaqState {
  FaqInitial({required super.isLoading});
}

class FaqError extends FaqState {
  final String? mErrorMsg;
  FaqError({this.mErrorMsg, required super.isLoading});
  @override
  List<Object> get props => [mErrorMsg!];
}

class FaqSuccess extends FaqState {
  final List<FaqModel> mFaqModel;
  FaqSuccess({required this.mFaqModel, required super.isLoading});
  @override
  List<Object> get props => [mFaqModel];
}