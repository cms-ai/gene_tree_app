import 'package:flutter/widgets.dart';

abstract class ColorModelImpl {
  //
  // Background color list
  //
  Color get bgColor1;
  Color get bgColor2;
  //
  // Button color
  //
  Color get btnColor1;
  Color get btnColor2;
  Gradient get linearBtnColor1;

  //
  // Main color
  //
  Color get mainBgColor1;
  Color get mainPrimaryColor;
  Color get mainSecondaryColor;
  Color get mainSecondaryColor1;
  Color get mainSecondaryColor2;
  Color get mainSecondaryColor3;

  //
  // Text color
  //
  Color get textTitleColor;
  Color get textBodyColor;
  Color get textLabelColor;
  Color get textPlaceholderColor;
  Color get textDisableColor;

  ///
  /// Gradient color
  ///
  LinearGradient get linegradientColor;
  LinearGradient get linegradientColor1;
  LinearGradient get linegradientColor2;

  //
  // Status color
  //
  Color get stCollectColor;
  Color get stSpendColor;
  Color get stStillColor;
  Color get stWarningColor;
}
