part of '../cp_cm_text_field.dart';

enum CMTexFieldTypeEnum { normal, password, search, datetime }

class CPCmTextFieldConfigs {
  final CMTexFieldTypeEnum type;
  final String? labelText;
  final HintTextConfigs? hintTextConfigs;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final int? maxLines;
  final void Function(String)? onChanged;
  const CPCmTextFieldConfigs({
    this.type = CMTexFieldTypeEnum.normal,
    this.labelText,
    this.contentPadding,
    this.hintTextConfigs,
    this.controller,
    this.maxLines,
    this.onChanged,
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
