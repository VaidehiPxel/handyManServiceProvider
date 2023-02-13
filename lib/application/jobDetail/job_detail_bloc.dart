import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/application/jobDetail/job_detail_event.dart';
import 'package:flutter_projects/application/jobDetail/job_detail_state.dart';

import 'package:flutter_projects/services/job_detail_service.dart';

class JobDetailBloc extends Bloc<JobDetailEvent, JobDetailState> {
  final JobDetailService jobDetailService;

  JobDetailBloc({required this.jobDetailService})
      : super(const JobDetailInitial()) {
    on<JobDetailEvent>((event, emit) async {
      if (event is JobDetailCallApiEvent) {
        emit(JobDetailLoading());
        await jobDetailService.jobDetail(
          jobId: event.jobId,
          errorCallBack: (appError) {
            emit(JobDetailError(
              mErrorMsg: appError,
            ));
          },
          jobDetailData: (jobdetail) {
            emit(JobDetailSuccess(
              jobDetailModel: jobdetail,
            ));
          },
        );
      } else if (event is BidUpdateApiEvent) {
        print("kkkkk");
        print(event is JobDetailLoading);
        emit(BidUpdateLoading());
        await jobDetailService.bidUpdate(
          jobId: event.jobId,
          userId: event.userId,
          amount: event.amount,
          errorCallBack: (appError) {
            emit(JobDetailError(
              mErrorMsg: appError,
            ));
          },
          bidUpdate: (isUpdate, msg) {
            if (isUpdate) {
              emit(const BidUpdateSuccess(isUpdate: true));
            } else {
              emit(const JobDetailError());
            }
          },
        );
      } else if (event is BidRemoveApiEvent) {
        emit(BidLoading());
        await jobDetailService.bidRemove(
          jobId: event.jobId,
          userId: event.userId,
          errorCallBack: (appError) {
            emit(JobDetailError(
              mErrorMsg: appError,
            ));
          },
          bidUpdate: (isUpdate, msg) {
            if (isUpdate) {
              emit(const BidRemoveSuccess());
            } else {
              emit(const JobDetailError());
            }
          },
        );
      }
    });
  }
}
