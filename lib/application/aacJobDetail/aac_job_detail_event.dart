part of 'aac_job_detail_bloc.dart';

abstract class AACJobDetailEvent extends Equatable {
  const AACJobDetailEvent();

  @override
  List<Object> get props => [];
}



class JobStartCallApiEvent extends AACJobDetailEvent {
  final int jobId;

  const JobStartCallApiEvent(
      {required this.jobId,
     });

  @override
  List<Object> get props => [jobId, ];
}

class JobCompleteCallApiEvent extends AACJobDetailEvent {
  final int jobId;
  final int timecounter;
  final bool isExtraWork;
  final String? esTitle;
  final int? esTime;
  final int? esAmount;
  final int totalAmount;

  const JobCompleteCallApiEvent(
      {required this.jobId,
      required this.timecounter,
      required this.isExtraWork,
      required this.totalAmount,
      this.esTime,
      this.esTitle,
      this.esAmount});

  @override
  List<Object> get props => [jobId, timecounter, isExtraWork];
}

class AACJobDetailSuccessEvent extends AACJobDetailEvent {
  final MyJobListModel myJobListModel;

  const AACJobDetailSuccessEvent({
    required this.myJobListModel,
  });

  @override
  List<Object> get props => [
        myJobListModel,
      ];
}
