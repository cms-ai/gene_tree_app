part of 'update_clan_bloc.dart';

@freezed
class UpdateClanState with _$UpdateClanState {
  const factory UpdateClanState.initial() = _Initial;
  const factory UpdateClanState.loading() = _Updating;
  const factory UpdateClanState.success({ClanEntity? clanEnity}) = _Success;
  const factory UpdateClanState.error({required String title, required String content}) = _Error;
}
