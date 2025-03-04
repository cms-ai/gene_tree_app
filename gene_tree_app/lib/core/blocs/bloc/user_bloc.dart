import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_storage.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/domain/entities/clan_entity.dart';
import 'package:gene_tree_app/domain/entities/user_entity.dart';
import 'package:gene_tree_app/domain/usecase/clan/get_all_clan_usecase.dart';
import 'package:gene_tree_app/domain/usecase/user/get_user.usecase.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final LocalStorage localStorage;
  final GetAllClanUsecase getAllClanUsecase;
  final GetUserUsecase getUserUsecase;
  UserBloc({
    required this.localStorage,
    required this.getUserUsecase,
    required this.getAllClanUsecase,
  }) : super(const UserState.initial()) {
    on<UserEvent>((event, emit) async {
      await event.map(
        started: (value) async {},
        initialData: (value) async {
          UserEntity? userData;
          ClanEntity? clanEntity;
          final userId =
              await localStorage.get<String>(SharePreferenceKeys.userId.name);
          final clanId =
              await localStorage.get<String>(SharePreferenceKeys.clanId.name);

          if (userId == null || userId.isEmpty) return;

          userData = await getUserUsecase.call(userId);
          List<ClanEntity> clans = await getAllClanUsecase.call(userId);

          final indexClan = clans.indexWhere((element) => element.id == clanId);
          if (indexClan != -1) {
            clanEntity = clans[indexClan];
          } else {
            localStorage.remove(SharePreferenceKeys.clanId.name);
            if (clans.isNotEmpty) {
              clanEntity = clans.first;
              await localStorage.save(
                  SharePreferenceKeys.clanId.name, clanEntity.id);
            }
          }
          emit(
            state.copyWith(
              userData: userData,
              clanData: clanEntity,
            ),
          );
        },
        saveUserData: (value) async {
          // emit(state.copyWith(userData: value.user));
        },
        saveClanData: (value) async {
          // emit(state.copyWith(clanData: value.clan));
        },
      );
    });
  }
}
