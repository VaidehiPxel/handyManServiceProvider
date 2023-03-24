import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/model/report/report_service_provider.dart';
import 'package:flutter_projects/services/report_service.dart';

import '../../model/report/report_job_list.dart';
import '../../model/report/report_listing_model.dart';


part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, Report1State> {
  final ReportService reportService;

  ReportBloc({required this.reportService})
      : super(const ReportInitial(
          isLoading: true,
          getComplaints: [],
          getJobList: [],
          getServiceProvidersList: [],
        )) {
    on<ReportEvent>((event, emit) async {
      if (event is GetReportListCallApiEvent) {
        emit(const ReportLoading(
          isLoading: true,
          getComplaints: [],
          getJobList: [],
          getServiceProvidersList: [],
        ));
        await reportService.getComplaintList(
          errorCallBack: (appError) {
            emit(ReportError(
              mErrorMsg: appError,
              isLoading: false,
              getComplaints: state.getComplaints,
              getJobList: state.getJobList,
              getServiceProvidersList: state.getServiceProvidersList,
            ));
          },
          getComplaintsModel: (reportList) {
            emit(ReportSuccess(
              getComplaints: reportList,
              isLoading: false,
              getJobList: state.getJobList,
              getServiceProvidersList: state.getServiceProvidersList,
            ));
          },
        );
      } else if (event is CreateReportCallApiEvent) {
        emit(CreateReportLoading(
          isLoading: true,
          getComplaints: state.getComplaints,
          getJobList: state.getJobList,
          getServiceProvidersList: state.getServiceProvidersList,
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
              getComplaints: state.getComplaints,
              getJobList: state.getJobList,
              getServiceProvidersList: state.getServiceProvidersList,
            ));
          },
          createReportData: (isCreate) {
            emit(CreateReportSuccess(
              getComplaints: state.getComplaints,
              isLoading: false,
              getJobList: state.getJobList,
              getServiceProvidersList: state.getServiceProvidersList,
            ));
          },
        );
      }

      if (event is GetReportServiceListCallApiEvent) {
        emit(CreateReportLoading(
          isLoading: true,
          getComplaints: state.getComplaints,
          getJobList: state.getJobList,
          getServiceProvidersList: state.getServiceProvidersList,
        ));
        await reportService.getServiceProvidersList(
          errorCallBack: (appError) {
            emit(ReportError(
              mErrorMsg: appError,
              isLoading: false,
              getComplaints: state.getComplaints,
              getJobList: state.getJobList,
              getServiceProvidersList: state.getServiceProvidersList,
            ));
          },
          getServiceProvidersList: (serviceProvidersList) async {
            emit(ReportServiceListSuccess(
              isLoading: false,
              getComplaints: state.getComplaints,
              getJobList: state.getJobList,
              getServiceProvidersList: serviceProvidersList,
            ));
          },
        );
      }
      if (event is GetReportUserListCallApiEvent) {
        emit(CreateReportLoading(
          isLoading: true,
          getComplaints: state.getComplaints,
          getJobList: state.getJobList,
          getServiceProvidersList: state.getServiceProvidersList,
        ));

        await reportService.getJobList(
          errorCallBack: (appError) {
            emit(ReportError(
              mErrorMsg: appError,
              isLoading: false,
              getComplaints: state.getComplaints,
              getJobList: state.getJobList,
              getServiceProvidersList: state.getServiceProvidersList,
            ));
          },
          getJobListModel: (getJobList) {
            emit(ReportSuccess(
              getComplaints: state.getComplaints,
              isLoading: false,
              getJobList: getJobList,
              getServiceProvidersList: state.getServiceProvidersList,
            ));
          },
        );
      }
    });
  }
}
