part of 'dashboard_bloc.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    required DashboardTabEnum tab,
  }) = _DashboardState;

  factory DashboardState.initial({
    required DashboardTabEnum tab,
  }) {
    return DashboardState(tab: tab);
  }
}
