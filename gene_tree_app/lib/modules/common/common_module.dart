import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/core/config/env_config.dart';
import 'package:gene_tree_app/core/network/dio_client.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_storage.dart';
import 'package:gene_tree_app/core/utils/helpers/helpers.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/data/api_services/exports.dart';
import 'package:gene_tree_app/data/repositories/auth_repository_impl.dart';
import 'package:gene_tree_app/data/repositories/clan_repository_impl.dart';
import 'package:gene_tree_app/data/repositories/user_repository_impl.dart';
import 'package:gene_tree_app/domain/repositories/exports.dart';
import 'package:gene_tree_app/domain/usecase/auth/login_google.usecase.dart';
import 'package:gene_tree_app/domain/usecase/clan/delete_clan_usecase.dart';
import 'package:gene_tree_app/domain/usecase/clan/get_all_clan_usecase.dart';
import 'package:gene_tree_app/domain/usecase/clan/get_clan_events_usecase.dart';
import 'package:gene_tree_app/domain/usecase/clan/get_clan_members_usecase.dart';
import 'package:gene_tree_app/domain/usecase/clan/update_clan_usecase.dart';
import 'package:gene_tree_app/domain/usecase/user/get_user.usecase.dart';
import 'package:gene_tree_app/modules/common/bloc/bloc/app_bloc.dart';

class CommonModule extends Module {
  static const String path = "/onboard/";

  static String getRoutePath(CommonModuleEnum router) {
    return path + router.name;
  }

  @override
  void binds(Injector i) {
    i.addSingleton<LocalStorage>(SharedPreferencesStorage.new);
    i.addSingleton(AppBloc.new);
    i.addSingleton<JwtHelper>(JwtHelper.new);
    i.addSingleton(ThemeBloc.new);
    i.addSingleton(GoogleAuthHelper.new);
    i.addSingleton(DioClient.new);

    initApiServices(i);

    initUsecase(i);

    super.binds(i);
  }

  void initApiServices(Injector i) {
    i.addSingleton(
      () => AuthApiService(i.get<DioClient>().dio,
          baseUrl: EnvConfig.getRequired(EnvKeys.BASE_URL)),
    );

    i.addSingleton(
      () => UserApiService(i.get<DioClient>().dio,
          baseUrl: EnvConfig.getRequired(EnvKeys.BASE_URL)),
    );

    i.addSingleton(
      () => ClanApiService(i.get<DioClient>().dio,
          baseUrl: EnvConfig.getRequired(EnvKeys.BASE_URL)),
    );

    // Đăng ký AuthRepository
    i.addSingleton<AuthRepository>(
      () => AuthRepositoryImpl(i.get<AuthApiService>()),
    );

    // Đăng ký UserRepository
    i.addSingleton<UserRepository>(
      () => UserRepositoryImpl(i.get<UserApiService>()),
    );

    // Đăng ký ClanRepository
    i.addSingleton<ClanRepository>(
      () => ClanRepositoryImpl(i.get<ClanApiService>()),
    );
  }

  void initUsecase(Injector i) {
    // clan usecase
    i.addSingleton(GetAllClanUsecase.new);
    i.addSingleton(GetClanEventsUsecase.new);
    i.addSingleton(UpdateClanUsecase.new);
    i.addSingleton(DeleteClanUsecase.new);
    i.addSingleton(GetClanMembersUsecase.new);

    // user usecase
    i.addSingleton(GetUserUsecase.new);

    // auth usecase
    i.addSingleton(LoginGoogleUsecase.new);
  }
}

enum CommonModuleEnum {
  none("/"),
  ;

  final String path;
  const CommonModuleEnum(this.path);
}
