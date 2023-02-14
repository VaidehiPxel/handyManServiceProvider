import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_projects/model/jobs/my_joblist_model.dart';
import 'package:flutter_projects/services/my_job_service.dart';

part 'my_job_list_event.dart';
part 'my_job_list_state.dart';

class MyJobListBloc extends Bloc<MyJobListEvent, MyJobListState> {
  final MyJobService myJobService;

  MyJobListBloc({required this.myJobService})
      : super(const MyJobListInitial(isLoading: true, myJobsModel: [])) {
    on<MyJobListEvent>((event, emit) async {
      if (event is MyJobListCallApiEvent) {
        emit(const MyJobsStateLoading(
          isLoading: true,
          myJobsModel: [],
        ));
        await myJobService.getJobList(
          status: event.status,
          userId: event.userId,
          errorCallBack: (appError) {
            emit(MyJobListError(
                mErrorMsg: appError,
                isLoading: false,
                myJobsModel: state.myJobsModel));
          },
          myJobData: (myJobList) {
            emit(MyJobListSuccess(myJobsModel: myJobList, isLoading: false));
          },
        );
      }
    });
  }
}
