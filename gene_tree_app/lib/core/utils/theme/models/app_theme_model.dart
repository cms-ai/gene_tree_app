import 'package:flutter/material.dart';
import 'package:gene_tree_app/core/utils/theme/models/color/color_model.dart';
import 'package:gene_tree_app/core/utils/theme/models/color/color_model_impl.dart';
import 'package:gene_tree_app/core/utils/theme/models/font_size/app_font_size_model.dart';
import 'package:gene_tree_app/core/utils/theme/models/radius/app_radius_model.dart';
import 'package:gene_tree_app/core/utils/theme/models/spacing/app_spacing_model_impl.dart';
import 'package:gene_tree_app/core/utils/theme/models/typography/typography_model_impl.dart';
import 'package:gene_tree_app/core/utils/theme/models/spacing/app_spacing_model.dart';
import 'package:gene_tree_app/core/utils/theme/models/typography/typography_model.dart';

class AppThemeModel {
  final TypographyModelImpl typo;
  final AppSpacingModelImpl spacing;
  final ColorModelImpl color;
  final AppFontSizeModel size;
  final AppRadiusModel radius;
  final ThemeData theme;
  AppThemeModel({
    required this.typo,
    required this.spacing,
    required this.color,
    required this.size,
    required this.radius,
    required this.theme,
  });
}

var _lightThemeModel = AppThemeModel(
  typo: LightTypographyModel(),
  spacing: AppSpacingModel(),
  color: LightColorModel(),
  size: AppFontSizeModel(),
  radius: AppRadiusModel(),
  theme: ThemeData.light(),
);

var _darkThemeModel = AppThemeModel(
  typo: DarkTypographyModel(),
  spacing: AppSpacingModel(),
  color: DarkColorModel(),
  size: AppFontSizeModel(),
  radius: AppRadiusModel(),
  theme: ThemeData.dark(),
);

enum AppThemeEnum {
  lightTheme,
  darkTheme,
}

extension AppThemeEnumExt on AppThemeEnum {
  AppThemeModel themeData() {
    switch (this) {
      case AppThemeEnum.lightTheme:
        return _lightThemeModel;
      case AppThemeEnum.darkTheme:
        return _darkThemeModel;
    }
  }
}
