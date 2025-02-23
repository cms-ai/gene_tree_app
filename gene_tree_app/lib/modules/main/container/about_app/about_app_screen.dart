import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/models/app_theme_model.dart';
import 'package:gene_tree_app/gen/assets.gen.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/common/components/cm_app_bar/cp_cm_app_bar.dart';
import './bloc/about_app_bloc.dart';
part './models/about_app_argument.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({
    super.key,
    this.argument,
  });
  final AboutAppArgument? argument;

  @override
  Widget build(BuildContext context) {
    final AboutAppBloc bloc = Modular.get<AboutAppBloc>();

    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider.value(
          value: bloc,
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "AboutApp",
              appBar: const CPCmAppBar(
                configs: CPCmAppBarConfigs(
                  title: "About",
                ),
              ),
              body: (themeState) => Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    themeState.appThemeEnum == AppThemeEnum.darkTheme
                        ? Assets.images.darkLogo.svg(height: 54.h)
                        : Assets.images.lightLogo.svg(height: 54.h),
                    SizedBox(height: 20.h),
                    Text(
                      "Version: 1.0.0",
                      textAlign: TextAlign.center,
                      style:
                          themeState.appThemeEnum.themeData().typo.t12Regular,
                    ),
                    Text(
                      "Author: aitc.dev",
                      textAlign: TextAlign.center,
                      style:
                          themeState.appThemeEnum.themeData().typo.t12Regular,
                    ),
                    const Spacer(),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
