
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_event.dart';
part 'member_state.dart';
part 'member_bloc.freezed.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  MemberBloc() : super(const MemberState.initial()) {
    on<MemberEvent>((event, emit) {
    });
  }
}
