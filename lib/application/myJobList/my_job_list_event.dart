part of 'my_job_list_bloc.dart';

abstract class MyJobListEvent extends Equatable {
  const MyJobListEvent();

  @override
  List<Object> get props => [];
}

class MyJobListCallApiEvent extends MyJobListEvent {
  final int userId;
  final String status;
  const MyJobListCallApiEvent({required this.userId, required this.status});

  @override
  List<Object> get props => [userId, status];
}

class MyJobListSuccessEvent extends MyJobListEvent {
  final MyJobListModel myJobListModel;

  const MyJobListSuccessEvent({
    required this.myJobListModel,
  });

  @override
  List<Object> get props => [
        myJobListModel,
      ];
}
