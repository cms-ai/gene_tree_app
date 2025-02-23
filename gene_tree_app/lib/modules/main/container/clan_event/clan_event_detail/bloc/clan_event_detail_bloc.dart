
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clan_event_detail_event.dart';
part 'clan_event_detail_state.dart';
part 'clan_event_detail_bloc.freezed.dart';

class ClanEventDetailBloc extends Bloc<ClanEventDetailEvent, ClanEventDetailState> {
  ClanEventDetailBloc() : super(const ClanEventDetailState.initial()) {
    on<ClanEventDetailEvent>((event, emit) {
    });
  }
}
