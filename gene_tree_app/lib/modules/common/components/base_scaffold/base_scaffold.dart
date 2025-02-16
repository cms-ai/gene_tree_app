import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/core/utils/logger_utils.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/core/utils/theme/models/app_theme_model.dart';

part 'base_scaffold_configs.dart';

class BaseScaffold extends StatefulWidget {
  const BaseScaffold({
    super.key,
    required this.configs,
  });
  final BaseScaffoldConfigs configs;

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  @override
  void initState() {
    super.initState();
    LoggerUtil.infoLog("Current route: ${Modular.to.path}");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      buildWhen: (previous, current) =>
          previous.appThemeEnum != current.appThemeEnum,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.appThemeEnum.themeData().color.mainBgColor1,
          appBar: widget.configs.appBar,
          body: Stack(
            children: [
              SafeArea(
                bottom: Platform.isIOS,
                top: widget.configs.topSafeArea,
                child: widget.configs.body(state),
              ),
            ],
          ),
          bottomNavigationBar: widget.configs.bottomNavigationBar != null
              ? widget.configs.bottomNavigationBar!(state)
              : null,
        );
      },
    );
  }
}
