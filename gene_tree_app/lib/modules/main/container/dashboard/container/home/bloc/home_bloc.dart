import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_storage.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/domain/entities/clan_entity.dart';
import 'package:gene_tree_app/domain/entities/clan_event_entity.dart';
import 'package:gene_tree_app/domain/entities/clan_member_entity.dart';
import 'package:gene_tree_app/domain/entities/user_entity.dart';
import 'package:gene_tree_app/domain/usecase/clan/get_all_clan_usecase.dart';
import 'package:gene_tree_app/domain/usecase/clan/get_clan_events_usecase.dart';
import 'package:gene_tree_app/domain/usecase/clan/get_clan_members_usecase.dart';
import 'package:gene_tree_app/domain/usecase/user/get_user.usecase.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllClanUsecase getAllClanUsecase;
  final GetClanEventsUsecase getClanEventsUsecase;
  final GetClanMembersUsecase getClanMembersUsecase;
  final LocalStorage localStorage;
  final GetUserUsecase getUserUsecase;
  final StreamController<HomeEvent> _homeEventCtrl =
      StreamController<HomeEvent>.broadcast();

  HomeBloc(
    this.getAllClanUsecase,
    this.getClanEventsUsecase,
    this.getClanMembersUsecase,
    this.localStorage,
    this.getUserUsecase,
  ) : super(
          const HomeState.initial(
            userData: AsyncValue.loading(),
            clanData: AsyncValue.loading(),
            clanEvents: AsyncValue.loading(),
            clanMembers: AsyncValue.loading(),
          ),
        ) {
    void homeEventListenter(HomeEvent event) {
      add(event);
    }

    _homeEventCtrl.stream.listen((value) => homeEventListenter(value));

    on<HomeEvent>((event, emit) async {
      await event.map(
        started: (value) async {
          add(const _FetchUserData());
          add(const _FetchClanData());
        },
        fetchUserData: (_FetchUserData value) async {
          final userId =
              await localStorage.get<String>(SharePreferenceKeys.userId.name) ??
                  "";
          final userRes = await getUserUsecase.call(userId);

          if (userRes != null) {
            emit(state.copyWith(userData: AsyncValue.success(userRes)));
          }
        },
        fetchClanData: (_FetchClanData value) async {
          final userId =
              await localStorage.get<String>(SharePreferenceKeys.userId.name) ??
                  "";

          final String? localClanId = await localStorage.get<String>(
            SharePreferenceKeys.clanId.name,
          );
          final clanList = await getAllClanUsecase.call(userId);

          if (clanList.isNotEmpty) {
            late final ClanEntity clanData;
            final int indexClan = clanList.indexWhere(
              (element) => element.id == localClanId,
            );
            clanData = indexClan != -1 ? clanList[indexClan] : clanList.first;

            localStorage.save(
              SharePreferenceKeys.clanId.name,
              clanData.id,
            );

            emit(state.copyWith(clanData: AsyncValue.success(clanData)));
            final clanEvents = await getClanEventsUsecase.call(clanData.id);
            final clanMembers = await getClanMembersUsecase.call(clanData.id);
            emit(
              state.copyWith(
                clanEvents: AsyncValue.success(clanEvents),
                clanMembers: AsyncValue.success(clanMembers),
              ),
            );
          } else {
            localStorage.remove(SharePreferenceKeys.clanId.name);
            emit(
              state.copyWith(
                clanData: const AsyncValue.success(null),
                // clanEvents: const AsyncValue.success([]),
                // clanMembers: const AsyncValue.success([]),
              ),
            );
            return;
          }
        },
        refreshClanData: (_RefreshClanData value) {
          if (state.clanData.data == null) {
            add(const _FetchClanData());
          }
        },
        updateClanData: (_UpdateClanData value) {
          if (value.clan.id == state.clanData.data?.id) {
            emit(state.copyWith(
              clanData: AsyncValue.success(value.clan),
            ));
          }
        },
        deleteClanEvent: (_DeleteClanEvent value) {
          if (value.clanId == state.clanData.data?.id) {
            add(const _FetchClanData());
          }
        },
      );
    });
  }
  void receiveEvent(HomeEvent newEvent) {
    _homeEventCtrl.add(newEvent); // Bắn sự kiện vào stream
  }

  @override
  Future<void> close() {
    _homeEventCtrl.close();
    return super.close();
  }
}
