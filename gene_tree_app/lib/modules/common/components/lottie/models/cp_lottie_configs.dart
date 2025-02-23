part of '../cp_lottie.dart';

class CPLottieConfigs {
  final CpLottieEnum type;
  final String url;
  final double? width;
  final double? height;
  final bool? repeat;
  final bool? reverse;
  final Function(AnimationController controller)? onTap;
  const CPLottieConfigs({
    this.type = CpLottieEnum.asset,
    required this.url,
    this.width,
    this.height,
    this.onTap,
    this.repeat,
    this.reverse,
  });
  // CPLottieConfigs copyWith({
  //   CpLottieEnum? type,
  //   String? url,
  //   double? width,
  //   double? height,
  // }) {
  //   return CPLottieConfigs(
  //     type: type ?? this.type,
  //     url: url ?? this.url,
  //     width: width ?? this.width,
  //     height: height ?? this.height,
  //   );
  // }
}
