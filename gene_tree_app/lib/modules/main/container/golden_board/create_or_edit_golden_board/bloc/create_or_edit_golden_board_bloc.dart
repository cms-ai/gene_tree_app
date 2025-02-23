
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_or_edit_golden_board_event.dart';
part 'create_or_edit_golden_board_state.dart';
part 'create_or_edit_golden_board_bloc.freezed.dart';

class CreateOrEditGoldenBoardBloc extends Bloc<CreateOrEditGoldenBoardEvent, CreateOrEditGoldenBoardState> {
  CreateOrEditGoldenBoardBloc() : super(CreateOrEditGoldenBoardState.initial()) {
    on<CreateOrEditGoldenBoardEvent>((event, emit) {
    });
  }
}
