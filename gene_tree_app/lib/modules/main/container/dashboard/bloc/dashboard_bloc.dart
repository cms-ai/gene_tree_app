import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/models/enums/dashboard_enum.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc()
      : super(DashboardState.initial(tab: DashboardTabEnum.values.first)) {
    on<DashboardEvent>((event, emit) async {
      await event.map(
        initial: (value) async {},
        changeTab: (value) async {
          emit(
            state.copyWith(tab: value.tab),
          );
        },
      );
    });
  }
}
