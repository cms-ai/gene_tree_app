part of '../cp_cm_avatar.dart';

enum AvatarTypeEnum {
  network,
  assets,
}

class CPCmAvatarConfigs {
  final AvatarTypeEnum type;
  final String? imageUrl; // URL ảnh hoặc null nếu dùng fallback
  final double? size; // Kích thước avatar
  final BorderRadiusGeometry? borderRadius;

  const CPCmAvatarConfigs({
    required this.type,
    this.imageUrl,
    this.size,
    this.borderRadius,
  });
}
