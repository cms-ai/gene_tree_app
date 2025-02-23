import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/helpers/button_helpers.dart';
import 'package:gene_tree_app/core/utils/logger_utils.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
part './models/cp_button_configs.dart';

class CPButton extends StatefulWidget {
  const CPButton({
    super.key,
    required this.configs,
  });
  final CPButtonConfigs configs;

  @override
  State<CPButton> createState() => _CPButtonState();
}

class _CPButtonState extends State<CPButton> {
  Timer? timer;
  Decoration? get decoration {
    switch (widget.configs.type) {
      case ButtonType.primary:
        if (widget.configs.isDiabled == true) {
          return BoxDecoration(
            color: Colors.grey.withOpacity(.5),
            borderRadius: BorderRadius.circular(8.r),
          );
        }
        return widget.configs.decoration ??
            BoxDecoration(
              gradient: themeData.value.color.linearBtnColor1,
              borderRadius:
                  widget.configs.borderRadius ?? BorderRadius.circular(8.r),
            );

      case ButtonType.outline:
        return BoxDecoration(
          border: Border.all(
            color: themeData.value.color.mainPrimaryColor,
          ),
          borderRadius: BorderRadius.circular(8.r),
        );
      default:
        return null;
    }
  }

  TextStyle? get textStyle {
    switch (widget.configs.type) {
      case ButtonType.primary:
        if (widget.configs.isDiabled == true) {
          return themeData.value.typo.t14Semibold.copyWith(
            color: themeData.value.color.textDisableColor,
          );
        }
        return widget.configs.textStyle ?? themeData.value.typo.t14Semibold;
      default:
        return widget.configs.textStyle ??
            themeData.value.typo.t14Semibold.copyWith();
    }
  }

  @override
  Widget build(BuildContext context) {
    final throttler = Throttler(milliseconds: 1000);
    switch (widget.configs.type) {
      case ButtonType.primary:
        return GestureDetector(
          onTap: () {
            if (widget.configs.isDiabled == true) return;
            throttler.run(() {
              if (widget.configs.onTap != null) {
                LoggerUtil.infoLog("OnTap: $this");
                widget.configs.onTap!();
              }
            });
          },
          child: Container(
            padding: widget.configs.padding ??
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            width: widget.configs.width,
            height: widget.configs.height,
            decoration: decoration,
            child: Center(
              child: Text(widget.configs.content, style: textStyle),
            ),
          ),
        );
      case ButtonType.outline:
        return GestureDetector(
          onTap: () {
            throttler.run(() {
              if (widget.configs.onTap != null) {
                LoggerUtil.infoLog("OnTap: $this");
                widget.configs.onTap!();
              }
            });
          },
          child: Container(
            padding: widget.configs.padding ??
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            width: widget.configs.width,
            height: widget.configs.height,
            decoration: widget.configs.decoration ??
                BoxDecoration(
                  border: Border.all(
                      color: themeData
                          .value.color.mainPrimaryColor // Màu viền của button
                      ),
                  borderRadius: BorderRadius.circular(8.0), // Bo góc
                ),
            child: Row(
              mainAxisAlignment:
                  widget.configs.mainAxisAlignment ?? MainAxisAlignment.center,
              children: [
                if (widget.configs.prefixIcon != null)
                  widget.configs.prefixIcon ?? Container(),
                Text(
                  widget.configs.content,
                  style: widget.configs.textStyle ??
                      themeData.value.typo.t14Semibold.copyWith(
                        color: themeData
                            .value.color.mainPrimaryColor, // Màu chữ của button
                      ),
                ),
                if (widget.configs.suffixWidget != null)
                  widget.configs.suffixWidget ?? Container(),
              ],
            ),
          ),
        );
      default:
    }
    return Container();
  }
}
