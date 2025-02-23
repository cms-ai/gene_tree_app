
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clan_detail_event.dart';
part 'clan_detail_state.dart';
part 'clan_detail_bloc.freezed.dart';

class ClanDetailBloc extends Bloc<ClanDetailEvent, ClanDetailState> {
  ClanDetailBloc() : super(ClanDetailState.initial()) {
    on<ClanDetailEvent>((event, emit) {
    });
  }
}
