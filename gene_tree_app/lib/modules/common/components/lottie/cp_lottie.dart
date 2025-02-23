import 'package:flutter/material.dart';
import 'package:gene_tree_app/modules/common/components/lottie/models/cp_lottie_ennum.dart';
import 'package:gene_tree_app/core/utils/logger_utils.dart';
import 'package:lottie/lottie.dart';
part './models/cp_lottie_configs.dart';

class CPLottie extends StatefulWidget {
  const CPLottie({
    super.key,
    required this.configs,
  });
  final CPLottieConfigs configs;

  @override
  State<CPLottie> createState() => _CPLottieState();
}

class _CPLottieState extends State<CPLottie> with TickerProviderStateMixin {
  late AnimationController _controller = AnimationController(vsync: this);
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: widget.configs.reverse ?? false);

    if (widget.configs.repeat == true) {
      _controller.repeat(reverse: widget.configs.reverse ?? false);
    }

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Khi animation hoàn thành, thực hiện hành động ở đây
        LoggerUtil.debugLog("Animation completed!");
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final configs = widget.configs;

    return GestureDetector(
      onTap: () => configs.onTap != null ? configs.onTap!(_controller) : () {},
      child: _buildBody(configs),
    );
  }

  Widget _buildBody(CPLottieConfigs configs) {
    switch (configs.type) {
      case CpLottieEnum.asset:
        return Lottie.asset(
          configs.url,
          controller: _controller,
          width: configs.width,
          repeat: configs.repeat,
          reverse: configs.reverse,
          height: configs.height,
          fit: BoxFit.contain,
          onLoaded: (p0) {
            _controller.forward(from: 0);
          },
        );
      case CpLottieEnum.network:
        return LottieBuilder.network(
          configs.url,
          controller: _controller,
          width: configs.width,
          repeat: configs.repeat,
          height: configs.height,
          fit: BoxFit.contain,
        );
      default:
        return Container();
    }
  }
}
