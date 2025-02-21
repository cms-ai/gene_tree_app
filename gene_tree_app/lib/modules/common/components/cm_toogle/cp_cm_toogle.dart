import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
part './models/cp_cm_toogle_configs.dart';

class CPCmToogle extends StatefulWidget {
  const CPCmToogle({
    super.key,
    required this.configs,
  });
  final CPCmToogleConfigs configs;

  @override
  State<CPCmToogle> createState() => _CPCmToogleState();
}

class _CPCmToogleState extends State<CPCmToogle> {
  bool isToggled = false; // Trạng thái mặc định là tắt

  @override
  void initState() {
    isToggled = widget.configs.isToogled;
    super.initState();
  }

  void toggleSwitch() {
    setState(() {
      isToggled = !isToggled;
    });
    widget.configs.onChange(isToggled);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleSwitch, // Toggle khi nhấn
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 36.h,
        height: 22.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isToggled ? themeData.value.color.btnColor1 : Colors.grey,
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: Duration(milliseconds: 200),
              alignment:
                  isToggled ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: 16.h,
                height: 16.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
