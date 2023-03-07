part of 'aac_job_detail_bloc.dart';

abstract class AACJobDetailState extends Equatable {
  final bool isLoading;
  const AACJobDetailState({
    required this.isLoading,
  });

  @override
  List<Object> get props => [isLoading];
}

class AACJobDetailInitial extends AACJobDetailState {
  const AACJobDetailInitial({
    required super.isLoading,
  });
}

class AACJobDetailLoading extends AACJobDetailState {
  const AACJobDetailLoading({
    required super.isLoading,
  });
}

class AACJobDetailError extends AACJobDetailState {
  final String? mErrorMsg;
  const AACJobDetailError({
    this.mErrorMsg,
    required super.isLoading,
  });
  @override
  List<Object> get props => [mErrorMsg!];
}

class JobCompleteSuccess extends AACJobDetailState {
  const JobCompleteSuccess({
    required super.isLoading,
  });
}
