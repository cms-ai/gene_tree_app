import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/domain/entities/clan_event_entity.dart';
import 'package:gene_tree_app/modules/common/components/cm_image/cp_cm_image.dart';
part './models/cp_event_item_configs.dart';

class CPEventItem extends StatelessWidget {
  const CPEventItem({
    super.key,
    required this.configs,
    required this.data,
  });
  final CPEventItemConfigs configs;
  final ClanEventEntity data;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: themeData.value.color.btnColor2,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CPCmImage(
            configs: CPCmImageConfigs(
              type: ImageTypeEnum.network,
              path: "",
              width: 64.h,
              height: 64.h,
              borderRadius: BorderRadius.circular(14.r),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        data.title ?? "",
                        textAlign: TextAlign.start,
                        style: themeData.value.typo.t12Bold.copyWith(
                          color: themeData.value.color.mainSecondaryColor1,
                        ),
                      ),
                    ),
                    _buildEventStatusWidget()
                  ],
                ),
                SizedBox(height: 2.h),
                Text(
                  data.description ?? "",
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: themeData.value.typo.t10Regular.copyWith(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildEventStatusWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: themeData.value.color.mainSecondaryColor1,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        data.toStatusString(),
        style: themeData.value.typo.t10Semibold.copyWith(
          fontSize: 8.sp,
        ),
      ),
    );
  }
}
