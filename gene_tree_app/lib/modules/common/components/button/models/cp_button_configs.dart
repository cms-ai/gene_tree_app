part of '../cp_button.dart';

enum ButtonType {
  primary,
  secondary,
  danger,
  outline,
}

class CPButtonConfigs {
  final ButtonType type;
  final String content;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Widget? prefixIcon;
  final void Function()? onTap;
  final TextStyle? textStyle;
  final Decoration? decoration;
  final bool? isDiabled;
  final BorderRadiusGeometry? borderRadius;
  const CPButtonConfigs({
    this.type = ButtonType.primary,
    this.content = '',
    this.width,
    this.height,
    this.padding,
    this.onTap,
    this.prefixIcon,
    this.textStyle,
    this.decoration,
    this.isDiabled,
    this.borderRadius,
  });

  CPButtonConfigs copyWith(ButtonType? type) {
    return CPButtonConfigs(
      type: type ?? this.type,
    );
  }
}
