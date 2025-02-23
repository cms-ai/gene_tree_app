
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_clan_event.dart';
part 'my_clan_state.dart';
part 'my_clan_bloc.freezed.dart';

class MyClanBloc extends Bloc<MyClanEvent, MyClanState> {
  MyClanBloc() : super(MyClanState.initial()) {
    on<MyClanEvent>((event, emit) {
    });
  }
}
