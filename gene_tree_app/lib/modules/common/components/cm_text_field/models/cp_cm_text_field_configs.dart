part of '../cp_cm_text_field.dart';

enum CMTexFieldTypeEnum { normal, password, search, datetime, pickOption }

class CPCmTextFieldConfigs {
  final CMTexFieldTypeEnum type;
  final String? labelText;
  final HintTextConfigs? hintTextConfigs;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final int? maxLines;
  final void Function(String)? onChanged;
  final void Function(String? onSubmit)? onSubmit;
  final bool readOnly;

  const CPCmTextFieldConfigs({
    this.type = CMTexFieldTypeEnum.normal,
    this.labelText,
    this.contentPadding,
    this.hintTextConfigs,
    this.controller,
    this.maxLines,
    this.onChanged,
    this.onSubmit,
    this.readOnly = false,
  });
}

class HintTextConfigs {
  final String? hintText;
  final TextStyle? hintStyle;
  const HintTextConfigs({
    this.hintText,
    this.hintStyle,
  });

  HintTextConfigs copyWith() {
    return const HintTextConfigs();
  }
}
