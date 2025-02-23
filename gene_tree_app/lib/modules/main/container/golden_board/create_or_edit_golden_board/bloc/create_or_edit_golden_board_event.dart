part of 'create_or_edit_golden_board_bloc.dart';

@freezed
class CreateOrEditGoldenBoardEvent with _$CreateOrEditGoldenBoardEvent {
  const factory CreateOrEditGoldenBoardEvent.started() = _Started;
}
