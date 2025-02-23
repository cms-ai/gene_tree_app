part of 'create_clan_bloc.dart';

@freezed
class CreateClanEvent with _$CreateClanEvent {
  const factory CreateClanEvent.started() = _Started;
  const factory CreateClanEvent.createClanEvent({
    required String name,
    required String description,
  }) = _CreateClanEvent;
}
