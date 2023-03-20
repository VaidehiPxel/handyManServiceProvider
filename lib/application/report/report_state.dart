part of 'report_bloc.dart';

abstract class Report1State extends Equatable {
  final bool isLoading;
  final List<Getcomplaint> getComplaints;
  final List<GetServiceProvidersList> getServiceProvidersList;
  final List<GetJobList> getJobList;
  const Report1State({
    required this.isLoading,
    required this.getComplaints,
    required this.getServiceProvidersList,
    required this.getJobList,
  });

  @override
  List<Object> get props => [isLoading];
}

class ReportInitial extends Report1State {
  const ReportInitial({
    required super.isLoading,
    required super.getComplaints,
    required super.getServiceProvidersList,
    required super.getJobList,
  });
}

class ReportLoading extends Report1State {
  const ReportLoading({
    required super.isLoading,
    required super.getComplaints,
    required super.getServiceProvidersList,
    required super.getJobList,
  });
}

class CreateReportLoading extends Report1State {
  const CreateReportLoading({
    required super.isLoading,
    required super.getComplaints,
    required super.getServiceProvidersList,
    required super.getJobList,
  });
}

class ReportError extends Report1State {
  final String? mErrorMsg;
  const ReportError({
    this.mErrorMsg,
    required super.isLoading,
    required super.getComplaints,
    required super.getServiceProvidersList,
    required super.getJobList,
  });
  @override
  List<Object> get props => [mErrorMsg!];
}

class ReportSuccess extends Report1State {
  const ReportSuccess({
    required super.isLoading,
    required super.getComplaints,
    required super.getServiceProvidersList,
    required super.getJobList,
  });
}

class CreateReportSuccess extends Report1State {
  const CreateReportSuccess({
    required super.isLoading,
    required super.getComplaints,
    required super.getServiceProvidersList,
    required super.getJobList,
  });
}

class ReportServiceListSuccess extends Report1State {
  const ReportServiceListSuccess({
    required super.isLoading,
    required super.getComplaints,
    required super.getServiceProvidersList,
    required super.getJobList,
  });
}
