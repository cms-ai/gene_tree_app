import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/core/utils/theme/models/app_theme_model.dart';
import 'package:gene_tree_app/core/utils/theme/models/font_size/app_font_size_model.dart';
part './models/cp_cm_app_bar_configs.dart';

class CPCmAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CPCmAppBar({
    super.key,
    required this.configs,
  });
  final CPCmAppBarConfigs configs;
  @override
  Widget build(BuildContext context) {
    final canPop = Modular.to.canPop();
    return BlocBuilder<ThemeBloc, ThemeState>(
      buildWhen: (previous, current) =>
          previous.appThemeEnum != current.appThemeEnum,
      builder: (context, state) {
        return AppBar(
          leading: canPop
              ? configs.prefixIcon ??
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color:
                          state.appThemeEnum.themeData().color.mainPrimaryColor,
                    ),
                    onPressed: () {
                      if (canPop) {
                        Modular.to.pop();
                      }
                    },
                  )
              : null,
          centerTitle: true,
          title: Text(
            configs.title,
            style: themeData.value.typo.t16Bold,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: configs.suffixWidget ?? Container(),
            )
          ],
          backgroundColor: state.appThemeEnum.themeData().color.mainBgColor1,
          elevation: 0, // Tùy chỉnh shadow của AppBar
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
