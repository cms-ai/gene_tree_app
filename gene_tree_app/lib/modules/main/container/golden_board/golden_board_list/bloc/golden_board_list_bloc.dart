
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'golden_board_list_event.dart';
part 'golden_board_list_state.dart';
part 'golden_board_list_bloc.freezed.dart';

class GoldenBoardListBloc extends Bloc<GoldenBoardListEvent, GoldenBoardListState> {
  GoldenBoardListBloc() : super(const GoldenBoardListState.initial()) {
    on<GoldenBoardListEvent>((event, emit) {
    });
  }
}
