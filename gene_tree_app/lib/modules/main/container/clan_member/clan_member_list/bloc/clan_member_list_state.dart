part of 'clan_member_list_bloc.dart';

@freezed
class ClanMemberListState with _$ClanMemberListState {
  const factory ClanMemberListState.initial({
    required AsyncValue<List<ClanMemberEntity>> members,
  }) = _Initial;
  
}
