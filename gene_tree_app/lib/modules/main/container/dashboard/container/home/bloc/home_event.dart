part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.updateClanData(ClanEntity clan) = _UpdateClanData;
  const factory HomeEvent.fetchUserData() = _FetchUserData;
  const factory HomeEvent.fetchClanData() = _FetchClanData;
  const factory HomeEvent.deleteClanEvent(String clanId) = _DeleteClanEvent;
  const factory HomeEvent.refreshClanData({ClanEntity? clanEntity}) =
      _RefreshClanData;
}
