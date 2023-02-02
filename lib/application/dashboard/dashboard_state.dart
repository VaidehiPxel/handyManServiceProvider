part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  final bool isLoading;
  const DashboardState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

class DashboardInitial extends DashboardState {
  DashboardInitial({required super.isLoading});
}

class DashboardError extends DashboardState {
  final String? mErrorMsg;
  DashboardError({this.mErrorMsg, required super.isLoading});
  @override
  List<Object> get props => [mErrorMsg!];
}

class DashboardSuccess extends DashboardState {
  final DashboardModel dashboardModel;
  DashboardSuccess({required this.dashboardModel, required super.isLoading});
  @override
  List<Object> get props => [dashboardModel];
}
