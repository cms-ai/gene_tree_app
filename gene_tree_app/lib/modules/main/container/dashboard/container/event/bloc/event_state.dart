part of 'event_bloc.dart';

@freezed
class EventState with _$EventState {
  const factory EventState.initial({
    required AsyncValue<List<ClanEventEntity>> clanEvents,
  }) = _Initial;
}
