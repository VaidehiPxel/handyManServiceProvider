import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_projects/model/jobs/my_joblist_model.dart';
import 'package:flutter_projects/services/aacJobDetail_service.dart';
import 'package:flutter_projects/services/my_job_service.dart';

part 'aac_job_detail_event.dart';
part 'aac_job_detail_state.dart';

class AACJobDetailBloc extends Bloc<AACJobDetailEvent, AACJobDetailState> {
  final AACJobDetailService aacJobDetailService;

  AACJobDetailBloc({required this.aacJobDetailService})
      : super(const AACJobDetailInitial(
          isLoading: true,
        )) {
    on<AACJobDetailEvent>((event, emit) async {
      if (event is JobStartCallApiEvent) {
        emit(const AACJobDetailLoading(
          isLoading: true,
        ));
        await aacJobDetailService.jobStart(
          jobId: event.jobId,
          errorCallBack: (appError) {
            emit(AACJobDetailError(
              mErrorMsg: appError,
              isLoading: false,
            ));
          },
          jobStart: (isJobComplete, message) {
            emit(const JobCompleteSuccess(isLoading: false));
          },
        );
      } else if (event is JobCompleteCallApiEvent) {
        emit(const AACJobDetailLoading(
          isLoading: true,
        ));
        await aacJobDetailService.jobComplete(
          jobId: event.jobId,
          timecounter: event.timecounter,
          isExtraWork: event.isExtraWork,
          totalAmount: event.totalAmount,
          esTitle: event.esTitle,
          esTime: event.esTime,
          esAmount: event.esAmount,
          errorCallBack: (appError) {
            emit(AACJobDetailError(
              mErrorMsg: appError,
              isLoading: false,
            ));
          },
          jobComplete: (isJobComplete, message) {
            emit(const JobCompleteSuccess(isLoading: false));
          },
        );
      }
    });
  }
}
