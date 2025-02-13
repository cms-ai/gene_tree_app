import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/core/utils/theme/models/app_theme_model.dart';
part './models/cp_cm_text_field_configs.dart';

class CPCmTextField extends StatefulWidget {
  const CPCmTextField({
    super.key,
    required this.configs,
    this.onChanged,
  });
  final CPCmTextFieldConfigs configs;
  final void Function(String)? onChanged;

  @override
  State<CPCmTextField> createState() => _CPCmTextFieldState();
}

class _CPCmTextFieldState extends State<CPCmTextField> {
  // final ThemeState themeState = Modular.get<ThemeBloc>().state;
  @override
  void dispose() {
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
        }
      },
    );
  }

  Widget _buildNormalTextField() {
    return TextField(
      controller: widget.configs.controller,
      decoration: InputDecoration(
        hintText: hintTextConfigs?.hintText,
        hintStyle: hintTextConfigs?.hintStyle ??
            themeData.value.typo.t14Semibold.copyWith(
              color: themeData.value.color.mainPrimaryColor.withOpacity(.4),
            ),
        contentPadding: widget.configs.contentPadding ?? EdgeInsets.all(12.h),
        isDense: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: themeData.value.color.mainPrimaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: themeData.value.color.mainPrimaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: themeData.value.color.mainPrimaryColor,
          ),
        ),
      ),
      onChanged: widget.onChanged,
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      controller: widget.configs.controller,
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
      onChanged: widget.onChanged,
    );
  }

  Widget _buildSearchTextField() {
    return TextField(
      controller: widget.configs.controller,
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
      onChanged: widget.onChanged,
    );
  }
}
