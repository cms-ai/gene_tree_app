part of 'update_clan_bloc.dart';

@freezed
class UpdateClanEvent with _$UpdateClanEvent {
  const factory UpdateClanEvent.started() = _Started;
  const factory UpdateClanEvent.deleteClan(String clanId) = _DeleteClan;
  const factory UpdateClanEvent.submit({
    required String clanId,
    String? nameClan,
    String? description,
  }) = _Submit;
}
