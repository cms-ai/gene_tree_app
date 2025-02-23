import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_storage.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/domain/usecase/clan/get_all_clan_usecase.dart';
import 'package:gene_tree_app/domain/usecase/user/get_user.usecase.dart';

part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final LocalStorage localStorage;
  final GetUserUsecase getUserUsecase;
  final GetAllClanUsecase getAllClanUsecase;

  SplashBloc({
    required this.localStorage,
    required this.getUserUsecase,
    required this.getAllClanUsecase,
  }) : super(const SplashState.initial()) {
    on<SplashEvent>((event, emit) async {
      await event.map(
        started: (value) async {
          try {
            // User lần đầu sử dụng app
            var firstLogin = await localStorage
                    .get<bool>(SharePreferenceKeys.firstLogin.name) ??
                false;

            final token = await localStorage.get<String>(
                  SharePreferenceKeys.token.name,
                ) ??
                "";

            final userId = await localStorage
                    .get<String>(SharePreferenceKeys.userId.name) ??
                "";

            if (token.isEmpty || userId.isEmpty || firstLogin) {
              await localStorage.save<bool>(
                SharePreferenceKeys.firstLogin.name,
                false,
              );
              emit(SplashState.unAuthenticated(firstLogin: firstLogin));
            } else {
              // get user api
              final user = await getUserUsecase.call(userId);

              // get clan API
              final clanList = await getAllClanUsecase.call(userId);
              if (user != null) {
                emit(
                  SplashState.authenticated(
                    completedUser: clanList.isNotEmpty,
                  ),
                );
              }
            }
          } catch (e) {
            emit(const SplashState.unAuthenticated(firstLogin: false));
          }
        },
      );
    });
  }
}
