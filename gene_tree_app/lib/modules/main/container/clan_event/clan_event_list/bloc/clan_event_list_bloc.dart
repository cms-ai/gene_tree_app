
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clan_event_list_event.dart';
part 'clan_event_list_state.dart';
part 'clan_event_list_bloc.freezed.dart';

class ClanEventListBloc extends Bloc<ClanEventListEvent, ClanEventListState> {
  ClanEventListBloc() : super(ClanEventListState.initial()) {
    on<ClanEventListEvent>((event, emit) {
    });
  }
}
