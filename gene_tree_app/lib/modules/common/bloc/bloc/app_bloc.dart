import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const _Initial()) {
    on<AppEvent>((event, emit) async {
      await event.map(
        started: (value) async {},
        showError: (_ShowError value) {
          emit(AppState.error(value.error));
        },
      );
    });
  }
}
