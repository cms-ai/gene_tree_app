import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/gen/assets.gen.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/common/components/lottie/cp_lottie.dart';

part 'models/cm_dialog_argument.dart';

class CmDialogScreen {
  final CmDialogArgument argument;
  static bool _isDialogShowing = false;
  static CmDialogType? type;

  CmDialogScreen({required this.argument});

  Future<void> show(BuildContext context) async {
    if (type == argument.type) {
      return;
    }
    if (_isDialogShowing) {
      await dismissCurrentDialog(context);
    }

    _isDialogShowing = true; // Set the flag to true
    type = argument.type;

    // Mở dialog
    if (!context.mounted) return;
    switch (argument.type) {
      case CmDialogType.alert:
        await _showAlertDialog(context);
        break;
      case CmDialogType.confirmation:
        await _showConfirmationDialog(context);
        break;
      case CmDialogType.custom:
        await _showCustomContentDialog(context);
        break;
      case CmDialogType.loading:
        await _showLoadingDialog(context);
        break;
      case CmDialogType.none:
        await dismissCurrentDialog(context);
      case CmDialogType.success:
        await _showSuccessDialog(context);
        break;
    }
  }

  Future<void> dismissCurrentDialog(BuildContext context) async {
    if (_isDialogShowing) {
      Modular.to.pop();
    }
    _isDialogShowing = false;
  }

  Future<void> _showSuccessDialog(BuildContext context) async {
    await showDialog(
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: themeData.value.color.bgColor1.withOpacity(.9),
          shadowColor: themeData.value.color.mainPrimaryColor,
          contentPadding: EdgeInsets.zero,
          elevation: 2,
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      SizedBox(
                        width: double.infinity,
                        child: CPLottie(
                          configs: CPLottieConfigs(
                            url: Assets.gif.icSuccess.path,
                            height: 60.h,
                            onTap: (controller) {
                              controller.forward(from: 0);
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        argument.title ?? 'Successs',
                        textAlign: TextAlign.center,
                        style: themeData.value.typo.t14Semibold.copyWith(
                          color: themeData.value.color.btnColor2,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        argument.content ?? "",
                        textAlign: TextAlign.center,
                        style: themeData.value.typo.t12Regular.copyWith(
                          color: themeData.value.color.mainPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    Modular.to.pop();
                    if (argument.onConfirm != null) {}
                    argument.onConfirm!();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: themeData.value.color.btnColor2,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "OK",
                        style: themeData.value.typo.t12Bold.copyWith(
                          color: themeData.value.color.bgColor1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).then((_) {
      _isDialogShowing = false;
      type = null;
    });
  }

  Future<void> _showAlertDialog(BuildContext context) async {
    await showDialog(
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: themeData.value.color.bgColor1.withOpacity(.9),
          shadowColor: themeData.value.color.mainPrimaryColor,
          contentPadding: EdgeInsets.zero,
          elevation: 2,
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      SizedBox(
                        width: double.infinity,
                        child: CPLottie(
                          configs: CPLottieConfigs(
                            url: Assets.gif.icError.path,
                            height: 60.h,
                            onTap: (controller) {
                              controller.forward(from: 0);
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        argument.title ?? 'Alert',
                        textAlign: TextAlign.center,
                        style: themeData.value.typo.t14Semibold.copyWith(
                          color: themeData.value.color.btnColor2,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        argument.content ?? "",
                        textAlign: TextAlign.center,
                        style: themeData.value.typo.t12Regular.copyWith(
                          color: themeData.value.color.mainPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    Modular.to.pop();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: themeData.value.color.btnColor2,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: themeData.value.typo.t12Bold.copyWith(
                          color: themeData.value.color.bgColor1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).then((_) {
      _isDialogShowing = false;
      type = null;
    });
  }

  Future<void> _showConfirmationDialog(BuildContext context) async {
    await showDialog(
      // barrierColor: Colors.transparent,
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            argument.title ?? 'Confirmation',
            textAlign: TextAlign.center,
            style: themeData.value.typo.t16Semibold.copyWith(
              color: themeData.value.color.mainSecondaryColor1,
            ),
          ),
          backgroundColor: Color(0xFFF8F9FA),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                argument.content ?? 'Are you sure?',
                textAlign: TextAlign.center,
                style: themeData.value.typo.t12Regular.copyWith(
                  color: themeData.value.color.mainPrimaryColor,
                ),
              ),
              SizedBox(height: 20.h),
              CPButton(
                configs: CPButtonConfigs(
                  content: "Confirm",
                  padding: EdgeInsets.symmetric(vertical: 9.h),
                  textStyle: themeData.value.typo.t12Semibold,
                  onTap: () {
                    Navigator.of(context).pop();
                    if (argument.onConfirm != null) argument.onConfirm!();
                  },
                ),
              ),
              SizedBox(height: 10.h),
              CPButton(
                configs: CPButtonConfigs(
                  type: ButtonType.outline,
                  content: "Cancel",
                  padding: EdgeInsets.symmetric(vertical: 9.h),
                  textStyle: themeData.value.typo.t12Semibold,
                  onTap: () {
                    Navigator.of(context).pop();
                    if (argument.onCancel != null) argument.onCancel!();
                  },
                ),
              ),
            ],
          ),
          // actions: [
          //   TextButton(
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //       if (argument.onCancel != null) argument.onCancel!();
          //     },
          //     child: Text(
          //       'Cancel',
          //       style: TextStyle(
          //         color: themeData.value.color.btnColor2,
          //       ),
          //     ),
          //   ),
          //   TextButton(
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //       if (argument.onConfirm != null) argument.onConfirm!();
          //     },
          //     child: const Text('Confirm'),
          //   ),
          // ],
        );
      },
    ).then((_) {
      _isDialogShowing = false;
      type = null;
    });
    ;
  }

  Future<void> _showCustomContentDialog(BuildContext context) async {
    await showDialog(
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(argument.title ?? 'Custom Dialog'),
                const SizedBox(height: 10),
                Text(argument.content ?? 'Custom content here.'),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        if (argument.onCancel != null) argument.onCancel!();
                      },
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        if (argument.onConfirm != null) argument.onConfirm!();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showLoadingDialog(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismiss by tapping outside
      builder: (context) {
        return PopScope(
          canPop: false,
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.zero,
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: IntrinsicWidth(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20.h),
                      decoration: BoxDecoration(
                        color: themeData.value.color.bgColor1.withOpacity(.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CircularProgressIndicator(
                        color: themeData.value.color.mainSecondaryColor1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ).then((_) {
      _isDialogShowing = false;
      type = null;
    });
  }
}
