
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cm_dialog_event.dart';
part 'cm_dialog_state.dart';
part 'cm_dialog_bloc.freezed.dart';

class CmDialogBloc extends Bloc<CmDialogEvent, CmDialogState> {
  CmDialogBloc() : super(const CmDialogState.initial()) {
    on<CmDialogEvent>((event, emit) {
    });
  }
}
