import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/gen/assets.gen.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/common/components/cm_avatar/cp_cm_avatar.dart';
import 'package:gene_tree_app/modules/common/components/lottie/cp_lottie.dart';
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

  Widget _buildBody(ThemeState themeState) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HomeAppBar(themeState: themeState),
            HomeClan(themeState: themeState),
            SizedBox(height: 20.h),
            HomeClanEvent(themeState: themeState),
          ],
        ),
      ),
    );
  }
}
