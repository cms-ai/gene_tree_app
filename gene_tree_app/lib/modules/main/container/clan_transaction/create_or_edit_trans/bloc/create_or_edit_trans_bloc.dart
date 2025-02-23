
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_or_edit_trans_event.dart';
part 'create_or_edit_trans_state.dart';
part 'create_or_edit_trans_bloc.freezed.dart';

class CreateOrEditTransBloc extends Bloc<CreateOrEditTransEvent, CreateOrEditTransState> {
  CreateOrEditTransBloc() : super(CreateOrEditTransState.initial()) {
    on<CreateOrEditTransEvent>((event, emit) {
    });
  }
}
