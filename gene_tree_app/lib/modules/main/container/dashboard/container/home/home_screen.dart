import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/gen/assets.gen.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/main/main_module.dart';
import './bloc/home_bloc.dart';
import 'widgets/widgets.dart';
part './models/home_argument.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    this.argument,
  });
  final HomeArgument? argument;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeBloc = Modular.get<HomeBloc>();

  @override
  void initState() {
    homeBloc.add(const HomeEvent.started());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider.value(
          value: homeBloc,
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "Home",
              body: (themeState) => _buildBody(themeState),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyClan() {
    return Column(
      children: [
        const Spacer(),
        Assets.images.emptyState.svg(),
        SizedBox(height: 10.h),
        Text(
          "Bạn chưa có gia tộc nào!\nHãy tham gia hoặc tạo Clan mới",
          textAlign: TextAlign.center,
          style: themeData.value.typo.t14Semibold,
        ),
        SizedBox(height: 20.h),
        CPButton(
          configs: CPButtonConfigs(
            width: 200.w,
            content: "Tạo gia tộc",
            onTap: () {
              Modular.to.pushNamed(
                MainModule.getRoutePath(
                  MainModuleEnum.createClan,
                ),
              );
            },
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Widget _buildBody(ThemeState themeState) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HomeAppBar(themeState: themeState),
          Expanded(
            child: BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (previous, current) =>
                  previous.clanData != current.clanData,
              builder: (context, state) {
                final status = state.clanData.status;
                if (status == AsyncStatus.success &&
                    state.clanData.data == null) {
                  return _buildEmptyClan();
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      HomeClan(themeState: themeState),
                      SizedBox(height: 20.h),
                      const HomeMember(),
                      SizedBox(height: 20.h),
                      HomeClanEvent(themeState: themeState),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
