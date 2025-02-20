part of '../cp_cm_image.dart';

enum ImageTypeEnum {
  network,
  assets,
}

class CPCmImageConfigs {
  final ImageTypeEnum type;
  final String path;
  final BorderRadiusGeometry? borderRadius;
  final double width;
  final double height;
  const CPCmImageConfigs({
    this.type = ImageTypeEnum.assets,
    required this.path,
    required this.width,
    required this.height,
    this.borderRadius,
  });
}
