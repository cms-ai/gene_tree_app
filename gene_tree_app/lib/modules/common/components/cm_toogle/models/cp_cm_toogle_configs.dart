part of '../cp_cm_toogle.dart';

class CPCmToogleConfigs {
  final bool isToogled;
  final Function(bool isToogled) onChange;
  const CPCmToogleConfigs({
    required this.isToogled,
    required this.onChange,
  });
}
