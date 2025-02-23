
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clan_trans_list_event.dart';
part 'clan_trans_list_state.dart';
part 'clan_trans_list_bloc.freezed.dart';

class ClanTransListBloc extends Bloc<ClanTransListEvent, ClanTransListState> {
  ClanTransListBloc() : super(ClanTransListState.initial()) {
    on<ClanTransListEvent>((event, emit) {
    });
  }
}
