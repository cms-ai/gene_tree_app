import 'package:flutter/material.dart';
import 'package:gene_tree_app/core/utils/theme/models/color/color_model_impl.dart';

class LightColorModel implements ColorModelImpl {
  @override
  Color get bgColor1 => const Color(0xFFFFFFFF);

  @override
  Color get bgColor2 => Color(0xFF000000).withOpacity(.05);

  @override
  Color get btnColor1 => const Color(0xFFFE904B);

  @override
  Color get btnColor2 => const Color(0xFF000000).withOpacity(.05);

  @override
  LinearGradient get linegradientColor => const LinearGradient(
        colors: [
          Color(0xFF89f7fe), // Xanh nhạt
          Color(0xFF66a6ff), // Xanh dương sáng
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  @override
  LinearGradient get linegradientColor1 => const LinearGradient(
        colors: [
          Color(0xFFff9a9e), // Hồng sáng
          Color(0xFFfad0c4), // Hồng đào
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );

  @override
  LinearGradient get linegradientColor2 => const LinearGradient(
        colors: [
          Color(0xFFe0e0e0), // Xám nhạt
          Color(0xFFffffff), // Trắng
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  @override
  // Color get mainBgColor1 => const Color(0xFF821C0D);
  Color get mainBgColor1 => const Color(0xFFFFFFFF);

  @override
  Color get mainPrimaryColor => const Color(0xFF000000);

  @override
  Color get mainSecondaryColor1 => const Color(0xFFFE904B);

  @override
  Color get mainSecondaryColor2 => const Color(0xFF3F4EAB);

  @override
  Color get mainSecondaryColor3 => const Color(0xFFA1A1A1);

  @override
  Color get stCollectColor => throw UnimplementedError();

  @override
  Color get stSpendColor => throw UnimplementedError();

  @override
  Color get stStillColor => throw UnimplementedError();

  @override
  Color get stWarningColor => throw UnimplementedError();

  @override
  Color get textBodyColor => const Color(0xFF4B4747);

  @override
  Color get textDisableColor => const Color(0xFFE7E7E7);

  @override
  Color get textLabelColor => const Color(0xFF8B8887);

  @override
  Color get textPlaceholderColor => const Color(0xFFCEC6C5);

  @override
  Color get textTitleColor => const Color(0xFF240E0A);

  //New
  @override
  Gradient get linearBtnColor1 => const LinearGradient(
        colors: [
          Color(0xFFFE904B),
          Color(0xFFFB724C),
        ],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      );
}

class DarkColorModel implements ColorModelImpl {
  @override
  Color get bgColor1 => const Color(0xFF000000);

  @override
  Color get bgColor2 => const Color(0xFF414143);

  @override
  Color get btnColor1 => const Color(0xFFFE904B);

  @override
  Color get btnColor2 => const Color(0xFF414143);

  @override
  LinearGradient get linegradientColor => const LinearGradient(
        colors: [
          Color(0xFF0F2027), // Đen xanh
          Color(0xFF203A43), // Xanh đậm
          Color(0xFF2C5364), // Xanh tím
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  @override
  LinearGradient get linegradientColor1 => const LinearGradient(
        colors: [
          Color(0xFF833ab4), // Tím đậm
          Color(0xFFfd1d1d), // Đỏ
          Color(0xFFfcb045), // Cam
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );

  @override
  LinearGradient get linegradientColor2 => const LinearGradient(
        colors: [
          Color(0xFF232526), // Xám đen
          Color(0xFF414345), // Xám trung tính
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  @override
  Color get mainBgColor1 => const Color(0xFF000000);
  // Color get mainBgColor1 => const Color(0xFF821C0D);

  @override
  Color get mainPrimaryColor => const Color(0xFFFFFFFF);

  @override
  Color get mainSecondaryColor1 => const Color(0xFFFE904B);

  @override
  Color get mainSecondaryColor2 => const Color(0xFF3F4EAB);

  @override
  Color get mainSecondaryColor3 => const Color(0xFFA1A1A1);

  @override
  Color get stCollectColor => throw UnimplementedError();

  @override
  Color get stSpendColor => throw UnimplementedError();

  @override
  Color get stStillColor => throw UnimplementedError();

  @override
  Color get stWarningColor => throw UnimplementedError();

  @override
  Color get textBodyColor => const Color(0xFF4B4747);

  @override
  Color get textDisableColor => const Color(0xFFE7E7E7);

  @override
  Color get textLabelColor => const Color(0xFF8B8887);

  @override
  Color get textPlaceholderColor => const Color(0xFFCEC6C5);

  @override
  Color get textTitleColor => const Color(0xFF240E0A);

  @override
  Gradient get linearBtnColor1 => const LinearGradient(
        colors: [
          Color(0xFFFE904B),
          Color(0xFFFB724C),
        ],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      );
}
