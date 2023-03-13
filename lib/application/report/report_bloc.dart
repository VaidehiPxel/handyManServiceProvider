import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_projects/model/report/report_listing_model.dart';
import 'package:flutter_projects/services/report_service.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, Report1State> {
  final ReportService reportService;

  ReportBloc({required this.reportService})
      : super(const ReportInitial(isLoading: true, getcomplaints: [])) {
    on<ReportEvent>((event, emit) async {
      if (event is GetReportListCallApiEvent) {
        emit(const ReportLoading(
          isLoading: true,
          getcomplaints: [],
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
        emit(const CreateReportLoading(
          isLoading: true,
          getcomplaints: [],
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
            emit(const ReportSuccess(getcomplaints: [], isLoading: false));
          },
        );
      }
    });
  }
}
