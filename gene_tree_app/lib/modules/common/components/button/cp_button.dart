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
  @override
  Widget build(BuildContext context) {
    final throttler = Throttler(milliseconds: 1000);
    switch (widget.configs.type) {
      case ButtonType.primary:
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
                  color: themeData.value.color.btnColor2, // Màu nền của button
                  gradient: themeData.value.color.linearBtnColor1,
                  borderRadius: BorderRadius.circular(8.r), // Bo góc
                ),
            child: Center(
              child: Text(
                widget.configs.content,
                style: widget.configs.textStyle ??
                    themeData.value.typo.t14Semibold.copyWith(),
              ),
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
                      color:
                          themeData.value.color.btnColor2 // Màu viền của button
                      ),
                  borderRadius: BorderRadius.circular(8.0), // Bo góc
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.configs.prefixIcon ?? Container(),
                Text(
                  widget.configs.content,
                  style: widget.configs.textStyle ??
                      themeData.value.typo.t14Semibold.copyWith(
                        color: themeData
                            .value.color.mainPrimaryColor, // Màu chữ của button
                      ),
                ),
              ],
            ),
          ),
        );
      default:
    }
    return Container();
  }
}
