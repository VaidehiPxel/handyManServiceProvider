import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_projects/model/home/dashboard_model.dart';
import 'package:flutter_projects/services/dashboard_service.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardService dashboardService;

  DashboardBloc({required this.dashboardService})
      : super(const DashboardInitial(isLoading: true)) {
    on<DashboardEvent>((event, emit) async {
      if (event is DashboardCallApiEvent) {
        await dashboardService.getDashboardData(
          errorCallBack: (appError) {},
          dashboardData: (dashBoard) {
            emit(DashboardSuccess(dashboardModel: dashBoard, isLoading: false));
          },
        );
      }
    });
  }
}
