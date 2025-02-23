import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/gen/assets.gen.dart';
import 'package:gene_tree_app/modules/common/components/cm_avatar/cp_cm_avatar.dart';
import 'package:gene_tree_app/modules/common/components/lottie/cp_lottie.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/container/home/bloc/home_bloc.dart';
import 'package:gene_tree_app/modules/main/l10n/generated/l10n.dart';
import 'package:gene_tree_app/modules/main/main_module.dart';
import 'package:shimmer/shimmer.dart';

class HomeAppBar extends StatefulWidget {
  final ThemeState themeState;
  const HomeAppBar({
    super.key,
    required this.themeState,
  });

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final status = state.userData.status;

        switch (status) {
          case AsyncStatus.loading:
            return Container(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              child: Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 48.h,
                      height: 48.h,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            width: 100.w,
                            height: 14.h,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.grey.shade300,
                                  Colors.grey.shade400
                                ],
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            width: 150.w,
                            height: 12.h,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.grey.shade300,
                                  Colors.grey.shade400
                                ],
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Shimmer.fromColors(
                  //   baseColor: Colors.grey.shade300,
                  //   highlightColor: Colors.grey.shade100,
                  //   child: Container(
                  //     width: 28.h,
                  //     height: 28.h,
                  //     decoration: BoxDecoration(
                  //       gradient: LinearGradient(
                  //         colors: [Colors.grey.shade300, Colors.grey.shade400],
                  //       ),
                  //       borderRadius: BorderRadius.circular(10.r),
                  //     ),
                  //   ),
                  // ),
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      themeData.value.color.btnColor2,
                      BlendMode.srcATop,
                    ),
                    child: CPLottie(
                      configs: CPLottieConfigs(
                        url: Assets.gif.icNotifyDark.path,
                        height: 28.h,
                        onTap: (controller) {
                          // onTap();
                          controller.forward(from: 0);
                          Modular.to.pushNamed(
                            MainModule.getRoutePath(
                                MainModuleEnum.notification),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          case AsyncStatus.success:
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              child: SizedBox(
                height: 40.h,
                child: Row(
                  children: [
                    CPCmAvatar(
                      configs: CPCmAvatarConfigs(
                        type: AvatarTypeEnum.network,
                        size: 40.h,
                        imageUrl: state.userData.data?.avatarUrl,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            MainLocalizations.current.hello,
                            textAlign: TextAlign.center,
                            style: themeData.value.typo.t14Bold,
                          ),
                          Text(
                            state.userData.data?.fullName ?? "",
                            textAlign: TextAlign.center,
                            style: themeData.value.typo.t16Bold.copyWith(
                              color: themeData.value.color.mainSecondaryColor1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        themeData.value.color.btnColor2,
                        BlendMode.srcATop,
                      ),
                      child: CPLottie(
                        configs: CPLottieConfigs(
                          url: Assets.gif.icNotifyDark.path,
                          height: 28.h,
                          onTap: (controller) {
                            // onTap();
                            controller.forward(from: 0);
                            Modular.to.pushNamed(
                              MainModule.getRoutePath(
                                  MainModuleEnum.notification),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          default:
            return Container();
        }
      },
    );
  }
}
