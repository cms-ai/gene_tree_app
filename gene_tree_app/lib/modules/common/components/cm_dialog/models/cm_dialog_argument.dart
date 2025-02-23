part of '../cm_dialog_screen.dart';

enum CmDialogType {
  alert,
  confirmation,
  custom,
  loading,
  none,
  success,
  bottomSheet,
}

class CmDialogArgument {
  final CmDialogType type;
  final String? title;
  final String? content;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final BottomSheetConfigs? bottomSheetConfigs;

  CmDialogArgument({
    required this.type,
    this.title,
    this.content,
    this.onConfirm,
    this.onCancel,
    this.bottomSheetConfigs,
  });
}

class BottomSheetConfigs {
  final Widget? child;
  final Function? onTap;

  BottomSheetConfigs({
    this.onTap,
    this.child,
  });
}
