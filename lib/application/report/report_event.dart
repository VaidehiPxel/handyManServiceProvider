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

class ReportListSuccessEvent extends ReportEvent {
  final Getcomplaints getcomplaints;

  const ReportListSuccessEvent({
    required this.getcomplaints,
  });

  @override
  List<Object> get props => [
        getcomplaints,
      ];
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
        jobId,jobTitle,description,
      ];
}


