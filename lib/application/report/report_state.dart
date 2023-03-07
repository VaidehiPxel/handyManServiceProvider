part of 'report_bloc.dart';

abstract class Report1State extends Equatable {
  final bool isLoading;
  final Getcomplaints getcomplaints;
  const Report1State({required this.isLoading, required this.getcomplaints});

  @override
  List<Object> get props => [isLoading];
}

class ReportInitial extends Report1State {
  const ReportInitial({required super.isLoading, required super.getcomplaints});
}

class ReportLoading extends Report1State {
  const ReportLoading({required super.isLoading, required super.getcomplaints});
}

class ReportError extends Report1State {
  final String? mErrorMsg;
  const ReportError(
      {this.mErrorMsg, required super.isLoading, required super.getcomplaints});
  @override
  List<Object> get props => [mErrorMsg!];
}

class ReportSuccess extends Report1State {
  const ReportSuccess({required super.isLoading, required super.getcomplaints});
}


