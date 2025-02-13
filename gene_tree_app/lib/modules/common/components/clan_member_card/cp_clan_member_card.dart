import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/domain/entities/clan_member_entity.dart';
import 'package:gene_tree_app/modules/common/components/cm_avatar/cp_cm_avatar.dart';
part './models/cp_clan_member_card_configs.dart';

class CPClanMemberCard extends StatelessWidget {
  const CPClanMemberCard({
    super.key,
    required this.configs,
  });
  final CPClanMemberCardConfigs configs;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: themeData.value.color.btnColor2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CPCmAvatar(
                  configs: CPCmAvatarConfigs(
                    type: AvatarTypeEnum.network,
                    size: 48.h,
                    imageUrl: "",
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nguyễn Văn A",
                        style: themeData.value.typo.t12Semibold,
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        "Chức vụ; Tộc trưởng",
                        style: themeData.value.typo.t10Semibold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            // top: 8,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: themeData.value.color.btnColor2,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "Đã mất",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
