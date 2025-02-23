import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_storage.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/core/utils/theme/models/app_theme_model.dart';

part 'theme_event.dart';
part 'theme_state.dart';
part 'theme_bloc.freezed.dart';

ValueNotifier<AppThemeModel> themeData =
    ValueNotifier(AppThemeEnum.lightTheme.themeData());

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final LocalStorage localStorage;
  ThemeBloc({required this.localStorage})
      : super(ThemeState.initial(
          AppThemeEnum.lightTheme,
          const Color(0xFF00BF4D),
        )) {
    on<ThemeEvent>(
      (event, emit) async {
        await event.map(
          initial: (value) async {
            final localTheme = await localStorage
                .get<String>(SharePreferenceKeys.currentTheme.name);
            if (localTheme != null) {
              if (localTheme == AppThemeEnum.darkTheme.name) {
                emit(state.copyWith(appThemeEnum: AppThemeEnum.darkTheme));
              } else {
                emit(state.copyWith(appThemeEnum: AppThemeEnum.lightTheme));
              }
            }
            configLoading(state.appThemeEnum);
          },
          toogleTheme: (value) async {
            final newTheme = state.appThemeEnum == AppThemeEnum.lightTheme
                ? AppThemeEnum.darkTheme
                : AppThemeEnum.lightTheme;
            localStorage.save<String>(
              SharePreferenceKeys.currentTheme.name,
              newTheme.name,
            );
            emit(state.copyWith(appThemeEnum: newTheme));

            localStorage.save<String>(
              SharePreferenceKeys.currentTheme.name,
              state.appThemeEnum.name,
            );
            configLoading(state.appThemeEnum);
          },
          changeMainColor: (_ChangeMainColor value) async {
            emit(state.copyWith(
              mainColor: value.color,
            ));
          },
        );
      },
    );
  }

  void configLoading(AppThemeEnum theme) {
    switch (theme) {
      case AppThemeEnum.lightTheme:
        EasyLoading.instance
          ..displayDuration = const Duration(milliseconds: 2000)
          ..indicatorType = EasyLoadingIndicatorType.fadingCircle
          ..loadingStyle = EasyLoadingStyle.dark
          ..indicatorSize = 45.0
          ..radius = 10.0
          ..progressColor = Colors.yellow
          ..backgroundColor = Colors.green
          ..indicatorColor = Colors.yellow
          ..textColor = Colors.yellow
          ..maskColor = Colors.blue.withOpacity(0.5)
          ..userInteractions = true
          ..dismissOnTap = false;
        break;
      case AppThemeEnum.darkTheme:
        EasyLoading.instance
          ..displayDuration = const Duration(milliseconds: 2000)
          ..indicatorType = EasyLoadingIndicatorType.fadingCircle
          ..loadingStyle = EasyLoadingStyle.light
          ..indicatorSize = 45.0
          ..radius = 10.0
          ..progressColor = Colors.yellow
          ..backgroundColor = Colors.green
          ..indicatorColor = Colors.yellow
          ..textColor = Colors.yellow
          ..maskColor = Colors.blue.withOpacity(0.5)
          ..userInteractions = true
          ..dismissOnTap = false;
        break;
      default:
    }
  }
}
