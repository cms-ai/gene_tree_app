import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/modules/common/components/cm_avatar/cp_cm_avatar.dart';
part './models/cp_cm_member_clan_item_configs.dart';

class CPCmMemberClanItem extends StatelessWidget {
  const CPCmMemberClanItem({
    super.key,
    required this.configs,
  });
  final CPCmMemberClanItemConfigs configs;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CPCmAvatar(
              configs: CPCmAvatarConfigs(
                type: AvatarTypeEnum.network,
                size: 40.h,
                imageUrl: "",
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Trần Công Ái",
                  maxLines: 1,
                  style: themeData.value.typo.t12Semibold.copyWith(
                    color: themeData.value.color.mainSecondaryColor1,
                  ),
                ),
                Text(
                  "Tộc trưởng",
                  maxLines: 1,
                  style: themeData.value.typo.t10Regular.copyWith(
                    color:
                        themeData.value.color.mainPrimaryColor.withOpacity(.5),
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          width: double.infinity,
          child: Divider(
            color: themeData.value.color.mainPrimaryColor.withOpacity(.5),
            thickness: 1,
            indent: 1,
          ),
        )
      ],
    );
  }
}
