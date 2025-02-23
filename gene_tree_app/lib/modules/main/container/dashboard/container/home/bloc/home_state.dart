part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial({
    required AsyncValue<UserEntity?> userData,
    required AsyncValue<ClanEntity?> clanData,
    required AsyncValue<List<ClanEventEntity>> clanEvents,
    required AsyncValue<List<ClanMemberEntity>> clanMembers,
  }) = _Initial;
}
