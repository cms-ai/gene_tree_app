import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/core/utils/theme/models/font_size/app_font_size_model.dart';
import 'package:gene_tree_app/gen/assets.gen.dart';
part './models/cp_cm_avatar_configs.dart';

class CPCmAvatar extends StatelessWidget {
  const CPCmAvatar({
    super.key,
    required this.configs,
  });
  final CPCmAvatarConfigs configs;
  @override
  Widget build(BuildContext context) {
    // final  themeBloc = Modular.get<ThemeBloc>();
    return Container(
      width: configs.size,
      height: configs.size,
      decoration: BoxDecoration(
        // shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(50.r),
        border: Border.all(
          color: themeData.value.color.btnColor2,
          width: 2,
        ),
      ),
      child: SizedBox(
        width: configs.size,
        height: configs.size,
        // decoration: BoxDecoration(shape: BoxShape.circle),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.r),
          child: CachedNetworkImage(
            imageUrl:
                "https://i1-giaitri.vnecdn.net/2022/09/23/-2181-1663929656.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=apYgDs9tYQiwn7pcDOGbNg",
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: Assets.images.avatarSvg.svg(),
            ),
          ),
        ),
      ),
    );
  }
}
