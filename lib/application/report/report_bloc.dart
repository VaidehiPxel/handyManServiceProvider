import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_projects/model/report/report_listing_model.dart';
import 'package:flutter_projects/services/report_service.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, Report1State> {
  final ReportService reportService;
  Getcomplaints getcomplaints = Getcomplaints(
      id: 0,
      jobId: 0,
      status: 0,
      userId: 0,
      complaintsDesc: "",
      createdAt: DateTime.now(),
      jobTitle: "",
      updatedAt: DateTime.now(),
      createdBy: 1);

  ReportBloc({required this.reportService})
      : super(ReportInitial(
            isLoading: true,
            getcomplaints: Getcomplaints(
                id: 0,
                jobId: 0,
                status: 0,
                userId: 0,
                complaintsDesc: "",
                createdAt: DateTime.now(),
                jobTitle: "",
                updatedAt: DateTime.now(),
                createdBy: 1))) {
    on<ReportEvent>((event, emit) async {
      if (event is GetReportListCallApiEvent) {
        emit(ReportLoading(
          isLoading: true,
          getcomplaints: getcomplaints,
        ));
        await reportService.getComplaintList(
          errorCallBack: (appError) {
            emit(ReportError(
                mErrorMsg: appError,
                isLoading: false,
                getcomplaints: state.getcomplaints));
          },
          getComplaintsModel: (reportList) {
            emit(ReportSuccess(getcomplaints: reportList, isLoading: false));
          },
        );
      } else if (event is CreateReportCallApiEvent) {
        emit(ReportLoading(
          isLoading: true,
          getcomplaints: getcomplaints,
        ));
        await reportService.createComplaint(
          jobId: event.jobId,
          jobTitle: event.jobTitle,
          userId: event.userId,
          description: event.description,
          errorCallBack: (appError) {
            emit(ReportError(
                mErrorMsg: appError,
                isLoading: false,
                getcomplaints: state.getcomplaints));
          },
          createReportData: (isCreate) {
            emit(ReportSuccess(getcomplaints: getcomplaints, isLoading: false));
          },
        );
      }
    });
  }
}
