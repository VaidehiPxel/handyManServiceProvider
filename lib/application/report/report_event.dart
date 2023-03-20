part of 'report_bloc.dart';

abstract class ReportEvent extends Equatable {
  const ReportEvent();

  @override
  List<Object> get props => [];
}

class GetReportListCallApiEvent extends ReportEvent {
  final int userId;
  const GetReportListCallApiEvent({
    required this.userId,
  });

  @override
  List<Object> get props => [
        userId,
      ];
}

class GetReportUserListCallApiEvent extends ReportEvent {
  const GetReportUserListCallApiEvent();

  @override
  List<Object> get props => [];
}

class GetReportServiceListCallApiEvent extends ReportEvent {
  const GetReportServiceListCallApiEvent();

  @override
  List<Object> get props => [];
}

class CreateReportCallApiEvent extends ReportEvent {
  final int userId;
  final int jobId;
  final String jobTitle;
  final String description;
  const CreateReportCallApiEvent({
    required this.userId,
    required this.jobId,
    required this.jobTitle,
    required this.description,
  });

  @override
  List<Object> get props => [
        userId,
        jobId,
        jobTitle,
        description,
      ];
}
