import 'package:equatable/equatable.dart';
import 'package:flutter_projects/model/jobs/job_detail_model.dart';

abstract class JobDetailState extends Equatable {
  final bool isLoading;
  final GetJobDetailModel jobDetailModel;

  const JobDetailState({required this.isLoading, required this.jobDetailModel});

  @override
  List<Object> get props => [];
}

class JobDetailInitial extends JobDetailState {
  const JobDetailInitial({
    required super.isLoading,
    required super.jobDetailModel,
  });
}

class JobDetailLoading extends JobDetailState {
  const JobDetailLoading({
    required super.isLoading,
    required super.jobDetailModel,
  });
}

class JobDetailError extends JobDetailState {
  final String? mErrorMsg;
  const JobDetailError({
    required this.mErrorMsg,
    required super.isLoading,
    required super.jobDetailModel,
  });
  @override
  List<Object> get props => [mErrorMsg!];
}

class BidUpdateLoading extends JobDetailState {
  const BidUpdateLoading(
      {required super.isLoading, required super.jobDetailModel});
}

class BidLoading extends JobDetailState {
  const BidLoading({
    required super.isLoading,
    required super.jobDetailModel,
  });
}

class JobDetailSuccess extends JobDetailState {
  const JobDetailSuccess(
      {required super.isLoading, required super.jobDetailModel});
}

class BidUpdateSuccess extends JobDetailState {
  final bool isUpdate;
  const BidUpdateSuccess({
    required this.isUpdate,
    required super.isLoading,
    required super.jobDetailModel,
  });
  @override
  List<Object> get props => [isUpdate];
}

class BidRemoveSuccess extends JobDetailState {
  const BidRemoveSuccess({
    required super.isLoading,
    required super.jobDetailModel,
  });
  @override
  List<Object> get props => [];
}
