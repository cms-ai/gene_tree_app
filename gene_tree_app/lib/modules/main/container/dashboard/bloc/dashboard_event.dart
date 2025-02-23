part of 'dashboard_bloc.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.initial() = _Initial;
  const factory DashboardEvent.changeTab(DashboardTabEnum tab) = _ChangeTab;
}
