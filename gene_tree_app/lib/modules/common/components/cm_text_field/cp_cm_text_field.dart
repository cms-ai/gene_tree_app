import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/helpers/date_time_helpers.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
part './models/cp_cm_text_field_configs.dart';

class CPCmTextField extends StatefulWidget {
  const CPCmTextField({
    super.key,
    required this.configs,
  });
  final CPCmTextFieldConfigs configs;

  @override
  State<CPCmTextField> createState() => _CPCmTextFieldState();
}

class _CPCmTextFieldState extends State<CPCmTextField> {
  // final ThemeState themeState = Modular.get<ThemeBloc>().state;
  late final StreamController<String> _streamController;
  @override
  void initState() {
    _streamController = StreamController<String>.broadcast();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.configs.controller?.addListener(_textListener);
    });
    super.initState();
  }

  void _textListener() {
    return _streamController.sink.add(widget.configs.controller?.text ?? "");
  }

  @override
  void didUpdateWidget(covariant CPCmTextField oldWidget) {
    if (oldWidget.configs.controller != widget.configs.controller) {
      oldWidget.configs.controller?.removeListener(_textListener);
      widget.configs.controller?.addListener(_textListener);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.configs.controller?.removeListener(_textListener);
    _streamController.close();
    super.dispose();
  }

  HintTextConfigs? get hintTextConfigs => widget.configs.hintTextConfigs;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        switch (widget.configs.type) {
          case CMTexFieldTypeEnum.normal:
            return _buildNormalTextField();
          case CMTexFieldTypeEnum.password:
            return _buildPasswordTextField();
          case CMTexFieldTypeEnum.search:
            return _buildSearchTextField();
          case CMTexFieldTypeEnum.datetime:
            return _buildDateTimeTextField();
          case CMTexFieldTypeEnum.pickOption:
            return _buildPickOptionTextField();
        }
      },
    );
  }

  Widget _buildPickOptionTextField() {
    return InkWell(
      onTap: () {
        if (widget.configs.onSubmit != null) {
          widget.configs.onSubmit!(widget.configs.controller?.text.trim());
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: themeData.value.color.bgColor2,
          borderRadius: BorderRadius.circular(14.r),
        ),
        padding: widget.configs.contentPadding ?? EdgeInsets.all(12.h),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.configs.labelText != null)
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: Text(
                        widget.configs.labelText ?? "",
                        style: themeData.value.typo.t10Semibold.copyWith(
                          color: themeData.value.color.mainSecondaryColor1,
                        ),
                      ),
                    ),
                  TextField(
                    controller: widget.configs.controller,
                    readOnly: widget.configs.readOnly,
                    enabled: false,
                    style: themeData.value.typo.t12Regular.copyWith(
                        color: themeData.value.color.mainPrimaryColor),
                    decoration: InputDecoration(
                      hintText: hintTextConfigs?.hintText,
                      hintStyle: hintTextConfigs?.hintStyle ??
                          themeData.value.typo.t12Regular.copyWith(
                            color: themeData.value.color.mainPrimaryColor
                                .withOpacity(.4),
                          ),
                      contentPadding:
                          // widget.configs.contentPadding ?? EdgeInsets.all(12.h),
                          EdgeInsets.zero,
                      isDense: true,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    onChanged: widget.configs.onChanged,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: themeData.value.color.mainPrimaryColor,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDateTimeTextField() {
    return InkWell(
      onTap: () {
        DateTimeHelper.pickDate(context, onSubmit: (dateFormat) {
          widget.configs.controller?.text = dateFormat;
          if (widget.configs.onChanged != null) {
            widget.configs.onChanged!(dateFormat);
          }

          setState(() {});
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: themeData.value.color.bgColor2,
          borderRadius: BorderRadius.circular(14.r),
        ),
        padding: widget.configs.contentPadding ?? EdgeInsets.all(12.h),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.configs.labelText != null)
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: Text(
                        widget.configs.labelText ?? "",
                        style: themeData.value.typo.t10Semibold.copyWith(
                          color: themeData.value.color.mainSecondaryColor1,
                        ),
                      ),
                    ),
                  TextField(
                    controller: widget.configs.controller,
                    readOnly: true,
                    enabled: false,
                    style: themeData.value.typo.t12Regular.copyWith(
                        color: themeData.value.color.mainPrimaryColor),
                    decoration: InputDecoration(
                      hintText: hintTextConfigs?.hintText,
                      hintStyle: hintTextConfigs?.hintStyle ??
                          themeData.value.typo.t12Regular.copyWith(
                            color: themeData.value.color.mainPrimaryColor
                                .withOpacity(.4),
                          ),
                      contentPadding:
                          // widget.configs.contentPadding ?? EdgeInsets.all(12.h),
                          EdgeInsets.zero,
                      isDense: true,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    onChanged: widget.configs.onChanged,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: themeData.value.color.mainPrimaryColor,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildNormalTextField() {
    return Container(
      decoration: BoxDecoration(
        color: themeData.value.color.bgColor2,
        borderRadius: BorderRadius.circular(14.r),
      ),
      padding: widget.configs.contentPadding ?? EdgeInsets.all(12.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.configs.labelText != null)
            Padding(
              padding: EdgeInsets.only(bottom: 2.h),
              child: Text(
                widget.configs.labelText ?? "",
                style: themeData.value.typo.t10Semibold.copyWith(
                  color: themeData.value.color.mainSecondaryColor1,
                ),
              ),
            ),
          TextField(
            controller: widget.configs.controller,
            maxLines: widget.configs.maxLines,
            style: themeData.value.typo.t12Regular.copyWith(
              color: themeData.value.color.mainPrimaryColor,
            ),
            readOnly: widget.configs.readOnly,
            decoration: InputDecoration(
              hintText: hintTextConfigs?.hintText,
              hintStyle: hintTextConfigs?.hintStyle ??
                  themeData.value.typo.t12Regular.copyWith(
                    color:
                        themeData.value.color.mainPrimaryColor.withOpacity(.4),
                  ),

              contentPadding:
                  // widget.configs.contentPadding ?? EdgeInsets.all(12.h),
                  EdgeInsets.zero,
              isDense: true,
              border: InputBorder.none,
              // filled: true,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            onChanged: widget.configs.onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      controller: widget.configs.controller,
      readOnly: widget.configs.readOnly,
      decoration: InputDecoration(
        hintText: hintTextConfigs?.hintText,
        hintStyle: hintTextConfigs?.hintStyle,
        contentPadding: widget.configs.contentPadding ?? EdgeInsets.all(8.h),
        isDense: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: themeData.value.color.mainPrimaryColor,
          ),
        ),
      ),
      onChanged: widget.configs.onChanged,
    );
  }

  Widget _buildSearchTextField() {
    return Container(
      decoration: BoxDecoration(
        color: themeData.value.color.bgColor2,
        borderRadius: BorderRadius.circular(14.r),
      ),
      padding: widget.configs.contentPadding ??
          EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
      child: Row(
        children: [
          StreamBuilder<String>(
            stream: _streamController.stream,
            builder: (context, snapshot) {
              return GestureDetector(
                onTap: () => {
                  if (widget.configs.onSubmit != null)
                    {
                      widget.configs
                          .onSubmit!(widget.configs.controller?.text.trim())
                    }
                },
                child: Icon(
                  Icons.search_rounded,
                  color: snapshot.data?.isNotEmpty == true
                      ? themeData.value.color.mainSecondaryColor1
                      : themeData.value.color.mainPrimaryColor,
                ),
              );
            },
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              controller: widget.configs.controller,
              style: themeData.value.typo.t12Regular
                  .copyWith(color: themeData.value.color.mainPrimaryColor),
              readOnly: widget.configs.readOnly,
              decoration: InputDecoration(
                hintText: hintTextConfigs?.hintText,
                hintStyle: hintTextConfigs?.hintStyle ??
                    themeData.value.typo.t12Regular.copyWith(
                      color: themeData.value.color.mainPrimaryColor
                          .withOpacity(.4),
                    ),
                contentPadding:
                    // widget.configs.contentPadding ?? EdgeInsets.all(12.h),
                    EdgeInsets.zero,
                isDense: true,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onChanged: widget.configs.onChanged,
            ),
          ),
          StreamBuilder<String>(
            stream: _streamController.stream,
            builder: (context, snapshot) {
              return snapshot.data?.isNotEmpty == true
                  ? GestureDetector(
                      onTap: () {
                        widget.configs.controller?.clear();
                      },
                      child: Icon(
                        Icons.close_rounded,
                        color: themeData.value.color.mainPrimaryColor,
                        size: 14.h,
                      ),
                    )
                  : Container();
            },
          ),
        ],
      ),
    );
  }
}
