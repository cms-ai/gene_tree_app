import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/common/common_module.dart';
import 'package:gene_tree_app/modules/main/container/clan/clan_detail/bloc/clan_detail_bloc.dart';
import 'package:gene_tree_app/modules/main/container/clan/clan_detail/clan_detail_screen.dart';
import 'package:gene_tree_app/modules/main/container/clan/create_clan/bloc/create_clan_bloc.dart';
import 'package:gene_tree_app/modules/main/container/clan/create_clan/create_clan_screen.dart';
import 'package:gene_tree_app/modules/main/container/clan/update_clan/bloc/update_clan_bloc.dart';
import 'package:gene_tree_app/modules/main/container/clan/update_clan/update_clan_screen.dart';
import 'package:gene_tree_app/modules/main/container/clan_member/clan_member_list/bloc/clan_member_list_bloc.dart';
import 'package:gene_tree_app/modules/main/container/clan_member/clan_member_list/clan_member_list_screen.dart';
import 'package:gene_tree_app/modules/main/container/clan_member/create_clan_member/bloc/create_clan_member_bloc.dart';
import 'package:gene_tree_app/modules/main/container/clan_member/create_clan_member/create_clan_member_screen.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/bloc/dashboard_bloc.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/container/event/bloc/event_bloc.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/container/home/bloc/home_bloc.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/dashboard_screen.dart';

class MainModule extends Module {
  static const String path = "/dashboard/";

  static String getRoutePath(MainModuleEnum router) {
    return path + router.name;
  }

  @override
  void routes(RouteManager r) {
    r.child(
      MainModuleEnum.dashboard.path,
      child: (context) => DashboardScreen(argument: r.args.data),
    );
    r.child(
      MainModuleEnum.updateClan.path,
      child: (context) => UpdateClanScreen(argument: r.args.data),
    );

    r.child(
      MainModuleEnum.clanDetail.path,
      child: (context) => ClanDetailScreen(argument: r.args.data),
    );
    r.child(
      MainModuleEnum.createClan.path,
      child: (context) => CreateClanScreen(argument: r.args.data),
    );
    r.child(
      MainModuleEnum.clanMemberList.path,
      child: (context) => ClanMemberListScreen(argument: r.args.data),
    );
    r.child(
      MainModuleEnum.createClanMember.path,
      child: (context) => CreateClanMemberScreen(argument: r.args.data),
    );

    super.routes(r);
  }

  @override
  List<Module> get imports => [CommonModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton<CreateClanBloc>(
      CreateClanBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
    i.addLazySingleton<HomeBloc>(
      HomeBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
    i.addLazySingleton<EventBloc>(
      EventBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );

    i.addLazySingleton<DashboardBloc>(
      DashboardBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );

    i.addLazySingleton<ClanDetailBloc>(
      ClanDetailBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
    i.addLazySingleton<UpdateClanBloc>(
      UpdateClanBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
    i.addLazySingleton<ClanMemberListBloc>(
      ClanMemberListBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
    i.addLazySingleton<CreateClanMemberBloc>(
      CreateClanMemberBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
  }
}

enum MainModuleEnum {
  dashboard("/"),
  // clan
  createClan('/createClan'),
  updateClan('/updateClan'),
  clanDetail('/clanDetail'),
  clanMemberList('/clanMemberList'),
  createClanMember('/createClanMember');

  final String path;
  const MainModuleEnum(this.path);
}
