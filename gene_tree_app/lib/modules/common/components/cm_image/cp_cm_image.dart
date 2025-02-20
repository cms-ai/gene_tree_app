import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gene_tree_app/gen/assets.gen.dart';
part './models/cp_cm_image_configs.dart';

class CPCmImage extends StatelessWidget {
  const CPCmImage({
    super.key,
    required this.configs,
  });
  final CPCmImageConfigs configs;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: configs.width,
      height: configs.height,
      decoration: BoxDecoration(
        borderRadius: configs.borderRadius,
      ),
      child: ClipRRect(
        borderRadius: configs.borderRadius ?? BorderRadius.zero,
        child: _buildImage(),
      ),
    );
  }

  Widget _buildImage() {
    switch (configs.type) {
      case ImageTypeEnum.assets:
        return Image.asset(configs.path);
      case ImageTypeEnum.network:
        return CachedNetworkImage(
          width: configs.width,
          height: configs.height,
          imageUrl: configs.path,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: configs.borderRadius,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          errorWidget: (context, url, error) => Assets.images.imageBg.image(
            fit: BoxFit.cover,
            width: configs.width,
            height: configs.height,
          ),
        );
    }
  }
}
