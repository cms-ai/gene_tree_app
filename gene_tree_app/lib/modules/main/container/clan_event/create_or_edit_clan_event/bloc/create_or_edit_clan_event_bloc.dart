
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_or_edit_clan_event_event.dart';
part 'create_or_edit_clan_event_state.dart';
part 'create_or_edit_clan_event_bloc.freezed.dart';

class CreateOrEditClanEventBloc extends Bloc<CreateOrEditClanEventEvent, CreateOrEditClanEventState> {
  CreateOrEditClanEventBloc() : super(const CreateOrEditClanEventState.initial()) {
    on<CreateOrEditClanEventEvent>((event, emit) {
    });
  }
}
