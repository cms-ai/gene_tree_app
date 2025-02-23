part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.fetchUserData() = _FetchUserData;
  const factory HomeEvent.fetchClanData() = _FetchClanData;
  const factory HomeEvent.refreshClanData({ClanEntity? clanEntity}) =
      _RefreshClanData;
}
