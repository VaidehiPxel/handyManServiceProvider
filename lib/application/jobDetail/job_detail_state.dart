import 'package:equatable/equatable.dart';
import 'package:flutter_projects/model/jobs/job_detail_model.dart';

abstract class JobDetailState extends Equatable {
  const JobDetailState();

  @override
  List<Object> get props => [];
}

class JobDetailInitial extends JobDetailState {
  const JobDetailInitial();
}

class JobDetailError extends JobDetailState {
  final String? mErrorMsg;
  const JobDetailError({
    this.mErrorMsg,
  });
  @override
  List<Object> get props => [mErrorMsg!];
}

class JobDetailLoading extends JobDetailState {}

class BidUpdateLoading extends JobDetailState {}

class BidLoading extends JobDetailState {}

class JobDetailSuccess extends JobDetailState {
  final GetJobDetailModel jobDetailModel;
  const JobDetailSuccess({
    required this.jobDetailModel,
  });
  @override
  List<Object> get props => [jobDetailModel];
}

class BidUpdateSuccess extends JobDetailState {
  final bool isUpdate;
  const BidUpdateSuccess({
    required this.isUpdate,
  });
  @override
  List<Object> get props => [isUpdate];
}

class BidRemoveSuccess extends JobDetailState {
  const BidRemoveSuccess();
  @override
  List<Object> get props => [];
}
