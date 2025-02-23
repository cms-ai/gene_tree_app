part of 'create_clan_bloc.dart';

@freezed
class CreateClanState with _$CreateClanState {
  const factory CreateClanState.initial({
    required bool isValid,
  }) = _Initial;
}
