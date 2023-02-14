import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/application/jobDetail/job_detail_event.dart';
import 'package:flutter_projects/application/jobDetail/job_detail_state.dart';
import 'package:flutter_projects/model/jobs/job_detail_model.dart';

import 'package:flutter_projects/services/job_detail_service.dart';

class JobDetailBloc extends Bloc<JobDetailEvent, JobDetailState> {
  final JobDetailService jobDetailService;

  JobDetailBloc({required this.jobDetailService})
      : super(JobDetailInitial(
            isLoading: true,
            jobDetailModel: GetJobDetailModel(
                jobsAppliedServiceProviders: [],
                message: "",
                result: [],
                status: "0"))) {
    on<JobDetailEvent>((event, emit) async {
      if (event is JobDetailCallApiEvent) {
        emit(JobDetailLoading(
            isLoading: false,
            jobDetailModel: GetJobDetailModel(
                jobsAppliedServiceProviders: [],
                message: "",
                result: [],
                status: "0")));
        await jobDetailService.jobDetail(
          jobId: event.jobId,
          errorCallBack: (appError) {
            emit(JobDetailError(
                isLoading: false,
                mErrorMsg: appError,
                jobDetailModel: GetJobDetailModel(
                    jobsAppliedServiceProviders: [],
                    message: "",
                    result: [],
                    status: "0")));
          },
          jobDetailData: (jobdetail) {
            emit(JobDetailSuccess(
              isLoading: false,
              jobDetailModel: jobdetail,
            ));
          },
        );
      } else if (event is BidUpdateApiEvent) {
        emit(BidUpdateLoading(
            isLoading: false,
            jobDetailModel: GetJobDetailModel(
                jobsAppliedServiceProviders: [],
                message: "",
                result: [],
                status: "0")));
        await jobDetailService.bidUpdate(
          jobId: event.jobId,
          userId: event.userId,
          amount: event.amount,
          isApplied: event.isApplied,
          errorCallBack: (appError) {
            emit(JobDetailError(
                isLoading: false,
                mErrorMsg: appError,
                jobDetailModel: GetJobDetailModel(
                    jobsAppliedServiceProviders: [],
                    message: "",
                    result: [],
                    status: "0")));
          },
          bidUpdate: (isUpdate, msg) {
            if (isUpdate) {
              emit(BidUpdateSuccess(
                  isUpdate: true,
                  isLoading: false,
                  jobDetailModel: GetJobDetailModel(
                      jobsAppliedServiceProviders: [],
                      message: "",
                      result: [],
                      status: "0")));
            } else {
              emit(JobDetailError(
                  isLoading: false,
                  mErrorMsg: msg,
                  jobDetailModel: GetJobDetailModel(
                      jobsAppliedServiceProviders: [],
                      message: "",
                      result: [],
                      status: "0")));
            }
          },
        );
      } else if (event is BidRemoveApiEvent) {
        emit(BidLoading(
            isLoading: false,
            jobDetailModel: GetJobDetailModel(
                jobsAppliedServiceProviders: [],
                message: "",
                result: [],
                status: "0")));
        await jobDetailService.bidRemove(
          jobId: event.jobId,
          userId: event.userId,
          errorCallBack: (appError) {
            emit(JobDetailError(
                isLoading: false,
                mErrorMsg: appError,
                jobDetailModel: GetJobDetailModel(
                    jobsAppliedServiceProviders: [],
                    message: "",
                    result: [],
                    status: "0")));
          },
          bidUpdate: (isUpdate, msg) {
            if (isUpdate) {
              emit(BidRemoveSuccess(
                  isLoading: false,
                  jobDetailModel: GetJobDetailModel(
                      jobsAppliedServiceProviders: [],
                      message: "",
                      result: [],
                      status: "0")));
            } else {
              emit(JobDetailError(
                  mErrorMsg: msg,
                  isLoading: false,
                  jobDetailModel: GetJobDetailModel(
                      jobsAppliedServiceProviders: [],
                      message: "",
                      result: [],
                      status: "0")));
            }
          },
        );
      }
    });
  }
}
