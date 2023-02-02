part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class DashboardCallApiEvent extends DashboardEvent {
  const DashboardCallApiEvent();

  @override
  List<Object> get props => [];
}

class DashboardSuccessEvent extends DashboardEvent {
  final DashboardModel dashboardModel;
  const DashboardSuccessEvent({required this.dashboardModel});

  @override
  List<Object> get props => [dashboardModel];
}
