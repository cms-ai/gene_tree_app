import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_storage.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/domain/entities/clan_event_entity.dart';
import 'package:gene_tree_app/domain/usecase/clan/get_clan_events_usecase.dart';

part 'event_event.dart';
part 'event_state.dart';
part 'event_bloc.freezed.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final GetClanEventsUsecase getClanEventsUsecase;
  final LocalStorage localStorage;

  EventBloc(
    this.getClanEventsUsecase,
    this.localStorage,
  ) : super(const EventState.initial(clanEvents: AsyncValue.loading())) {
    on<EventEvent>((event, emit) async {
      await event.map(started: (value) async {
        emit(state.copyWith(clanEvents: const AsyncValue.loading()));

        String? localClanId = await localStorage.get<String>(
          SharePreferenceKeys.clanId.name,
        );
        final clanEvents = await getClanEventsUsecase.call(localClanId ?? "");

        emit(state.copyWith(clanEvents: AsyncValue.success(clanEvents)));
      });
    });
  }
}
