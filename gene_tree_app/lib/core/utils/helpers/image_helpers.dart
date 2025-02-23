import 'package:flutter/widgets.dart';
import 'package:gene_tree_app/core/utils/theme/models/app_theme_model.dart';
import 'package:gene_tree_app/gen/assets.gen.dart';

class ImageHelpers {
  final AppThemeEnum themeEnum;
  ImageHelpers({required this.themeEnum});

  Widget getLogo({
    double? size,
  }) {
    return themeEnum == AppThemeEnum.darkTheme
        ? Assets.images.darkLogo.svg(height: size)
        : Assets.images.lightLogo.svg(height: size);
  }
}
