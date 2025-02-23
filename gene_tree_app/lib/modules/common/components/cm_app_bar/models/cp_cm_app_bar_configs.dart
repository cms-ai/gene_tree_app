part of '../cp_cm_app_bar.dart';

enum AppBarType {
  normal,
}

class CPCmAppBarConfigs {
  final AppBarType type;
  final String title;
  final Widget? prefixIcon;
  final Widget? suffixWidget;
  const CPCmAppBarConfigs({
    this.type = AppBarType.normal,
    this.title = "",
    this.prefixIcon,
    this.suffixWidget,
  });

  CPCmAppBarConfigs copyWith() {
    return const CPCmAppBarConfigs();
  }
}
