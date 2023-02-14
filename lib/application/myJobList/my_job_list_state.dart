part of 'my_job_list_bloc.dart';

abstract class MyJobListState extends Equatable {
  final bool isLoading;
  final List<Joblist> myJobsModel;
  const MyJobListState({required this.isLoading, required this.myJobsModel});

  @override
  List<Object> get props => [isLoading];
}

class MyJobListInitial extends MyJobListState {
  const MyJobListInitial(
      {required super.isLoading, required super.myJobsModel});
}

class MyJobsStateLoading extends MyJobListState {
  const MyJobsStateLoading(
      {required super.isLoading, required super.myJobsModel});
}

class MyJobListError extends MyJobListState {
  final String? mErrorMsg;
  const MyJobListError(
      {this.mErrorMsg, required super.isLoading, required super.myJobsModel});
  @override
  List<Object> get props => [mErrorMsg!];
}

class MyJobListSuccess extends MyJobListState {
  const MyJobListSuccess(
      {required super.isLoading, required super.myJobsModel});
}
