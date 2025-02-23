part of 'clan_member_list_bloc.dart';

@freezed
class ClanMemberListEvent with _$ClanMemberListEvent {
  const factory ClanMemberListEvent.started(String clanId) = _Started;
}
