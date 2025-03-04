import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/common/common_module.dart';
import 'package:gene_tree_app/modules/main/container/about_app/about_app_screen.dart';
import 'package:gene_tree_app/modules/main/container/about_app/bloc/about_app_bloc.dart';
import 'package:gene_tree_app/modules/main/container/clan/clan_detail/bloc/clan_detail_bloc.dart';
import 'package:gene_tree_app/modules/main/container/clan/clan_detail/clan_detail_screen.dart';
import 'package:gene_tree_app/modules/main/container/clan/create_clan/bloc/create_clan_bloc.dart';
import 'package:gene_tree_app/modules/main/container/clan/create_clan/create_clan_screen.dart';
import 'package:gene_tree_app/modules/main/container/clan/my_clan/bloc/my_clan_bloc.dart';
import 'package:gene_tree_app/modules/main/container/clan/my_clan/my_clan_screen.dart';
import 'package:gene_tree_app/modules/main/container/clan/update_clan/bloc/update_clan_bloc.dart';
import 'package:gene_tree_app/modules/main/container/clan/update_clan/update_clan_screen.dart';
import 'package:gene_tree_app/modules/main/container/clan_event/clan_event_detail/bloc/clan_event_detail_bloc.dart';
import 'package:gene_tree_app/modules/main/container/clan_event/clan_event_detail/clan_event_detail_screen.dart';
import 'package:gene_tree_app/modules/main/container/clan_event/clan_event_list/bloc/clan_event_list_bloc.dart';
import 'package:gene_tree_app/modules/main/container/clan_event/clan_event_list/clan_event_list_screen.dart';
import 'package:gene_tree_app/modules/main/container/clan_event/create_or_edit_clan_event/bloc/create_or_edit_clan_event_bloc.dart';
import 'package:gene_tree_app/modules/main/container/clan_event/create_or_edit_clan_event/create_or_edit_clan_event_screen.dart';
import 'package:gene_tree_app/modules/main/container/clan_member/clan_member_list/bloc/clan_member_list_bloc.dart';
import 'package:gene_tree_app/modules/main/container/clan_member/clan_member_list/clan_member_list_screen.dart';
import 'package:gene_tree_app/modules/main/container/clan_member/create_clan_member/bloc/create_clan_member_bloc.dart';
import 'package:gene_tree_app/modules/main/container/clan_member/create_clan_member/create_clan_member_screen.dart';
import 'package:gene_tree_app/modules/main/container/clan_transaction/clan_trans_list/bloc/clan_trans_list_bloc.dart';
import 'package:gene_tree_app/modules/main/container/clan_transaction/clan_trans_list/clan_trans_list_screen.dart';
import 'package:gene_tree_app/modules/main/container/clan_transaction/create_or_edit_trans/bloc/create_or_edit_trans_bloc.dart';
import 'package:gene_tree_app/modules/main/container/clan_transaction/create_or_edit_trans/create_or_edit_trans_screen.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/bloc/dashboard_bloc.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/container/event/bloc/event_bloc.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/container/home/bloc/home_bloc.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/container/member/bloc/member_bloc.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/container/settings/bloc/settings_bloc.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/dashboard_screen.dart';
import 'package:gene_tree_app/modules/main/container/golden_board/create_or_edit_golden_board/bloc/create_or_edit_golden_board_bloc.dart';
import 'package:gene_tree_app/modules/main/container/golden_board/create_or_edit_golden_board/create_or_edit_golden_board_screen.dart';
import 'package:gene_tree_app/modules/main/container/golden_board/golden_board_list/bloc/golden_board_list_bloc.dart';
import 'package:gene_tree_app/modules/main/container/golden_board/golden_board_list/golden_board_list_screen.dart';
import 'package:gene_tree_app/modules/main/container/language/bloc/language_bloc.dart';
import 'package:gene_tree_app/modules/main/container/language/language_screen.dart';
import 'package:gene_tree_app/modules/main/container/notification/bloc/notification_bloc.dart';
import 'package:gene_tree_app/modules/main/container/notification/notification_screen.dart';
import 'package:gene_tree_app/modules/main/guards/profile_guard.dart';

class MainModule extends Module {
  static const String path = "/dashboard/";

  static String getRoutePath(MainModuleEnum router) {
    return path + router.name;
  }

  @override
  void routes(RouteManager r) {
    r.child(
      MainModuleEnum.dashboard.path,
      child: (context) => DashboardScreen(
        argument: r.args.data as DashboardArgument?,
      ),
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
    r.child(
      MainModuleEnum.createOrEditClanEvent.path,
      child: (context) => CreateOrEditClanEventScreen(argument: r.args.data),
    );
    r.child(
      MainModuleEnum.eventClanDetail.path,
      child: (context) => ClanEventDetailScreen(argument: r.args.data),
    );
    r.child(
      MainModuleEnum.eventClanList.path,
      child: (context) => ClanEventListScreen(argument: r.args.data),
    );
    r.child(
      MainModuleEnum.createOrEditGoldenBoard.path,
      child: (context) => CreateOrEditGoldenBoardScreen(argument: r.args.data),
    );
    r.child(
      MainModuleEnum.goldenBoardList.path,
      child: (context) => GoldenBoardListScreen(argument: r.args.data),
    );
    r.child(
      MainModuleEnum.createOrEditTrans.path,
      child: (context) => CreateOrEditTransScreen(argument: r.args.data),
    );
    r.child(
      MainModuleEnum.clanTransList.path,
      child: (context) => ClanTransListScreen(argument: r.args.data),
    );
    r.child(
      MainModuleEnum.language.path,
      child: (context) => LanguageScreen(argument: r.args.data),
    );
    r.child(
      MainModuleEnum.myClan.path,
      child: (context) => MyClanScreen(argument: r.args.data),
    );
    r.child(
      MainModuleEnum.aboutApp.path,
      child: (context) => AboutAppScreen(argument: r.args.data),
    );
    r.child(
      MainModuleEnum.notification.path,
      child: (context) => NotificationScreen(argument: r.args.data),
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
    i.addLazySingleton<MemberBloc>(
      MemberBloc.new,
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
    i.addLazySingleton<SettingsBloc>(
      SettingsBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
    i.addLazySingleton<CreateOrEditClanEventBloc>(
      CreateOrEditClanEventBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
    i.addLazySingleton<ClanEventDetailBloc>(
      ClanEventDetailBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
    i.addLazySingleton<ClanEventListBloc>(
      ClanEventListBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
    i.addLazySingleton<CreateOrEditGoldenBoardBloc>(
      CreateOrEditGoldenBoardBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
    i.addLazySingleton<GoldenBoardListBloc>(
      GoldenBoardListBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
    i.addLazySingleton<CreateOrEditTransBloc>(
      CreateOrEditTransBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
    i.addLazySingleton<ClanTransListBloc>(
      ClanTransListBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
    i.addLazySingleton<LanguageBloc>(
      LanguageBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
    i.addLazySingleton<MyClanBloc>(
      MyClanBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
    i.addLazySingleton<AboutAppBloc>(
      AboutAppBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
    i.addLazySingleton<NotificationBloc>(
      NotificationBloc.new,
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
  createClanMember('/createClanMember'),
  createOrEditClanEvent('/createOrEditClanEvent'),
  createOrEditGoldenBoard('/createOrEditGoldenBoard'),
  createOrEditTrans('/createOrEditTrans'),
  clanTransList('/clanTransList'),
  goldenBoardList('/goldenBoardList'),
  eventClanDetail('/eventClanDetail'),
  eventClanList('/eventClanList'),
  language('/language'),
  myClan('/myClan'),
  aboutApp('/aboutApp'),
  notification('/notification');

  final String path;
  const MainModuleEnum(this.path);
}
