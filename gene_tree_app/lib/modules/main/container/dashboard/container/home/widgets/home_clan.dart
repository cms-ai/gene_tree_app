import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/core/utils/helpers/date_time_helpers.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/main/container/clan/clan_detail/clan_detail_screen.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/container/home/bloc/home_bloc.dart';
import 'package:gene_tree_app/modules/main/main_module.dart';
import 'package:gene_tree_app/modules/onboard/onboard_module.dart';
import 'package:shimmer/shimmer.dart';

class HomeClan extends StatefulWidget {
  final ThemeState themeState;
  const HomeClan({
    super.key,
    required this.themeState,
  });

  @override
  State<HomeClan> createState() => _HomeClanState();
}

class _HomeClanState extends State<HomeClan> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final status = state.clanData.status;

        switch (status) {
          case AsyncStatus.loading:
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.grey.shade300, Colors.grey.shade400],
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSkeletonRow(width: 200.w, height: 12.h),
                  SizedBox(height: 8.h),
                  _buildSkeletonRow(width: 150.w, height: 12.h),
                  SizedBox(height: 8.h),
                  _buildSkeletonRow(width: 180.w, height: 12.h),
                  SizedBox(height: 16.h),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: double.infinity,
                      height: 36.h,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ),
                ],
              ),
            );

          case AsyncStatus.success:
            return state.clanData.data != null
                ? Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
                    decoration: BoxDecoration(
                      gradient: themeData.value.color.linegradientColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      children: [
                        _buildClanDes(
                            title: "Tên gia tộc: ",
                            content: state.clanData.data?.clanName),
                        SizedBox(height: 8.h),
                        _buildClanDes(
                          title: "Người tạo",
                          content: "${state.clanData.data?.author?.fullName}",
                        ),
                        SizedBox(height: 8.h),
                        _buildClanDes(
                          title: "Số thành viên: ",
                          content:
                              "${state.clanData.data?.members?.length ?? 0}",
                        ),
                        SizedBox(height: 8.h),
                        // if (state.clanData.data?.createdAt != null)
                        _buildClanDes(
                          title: "Ngày tạo: ",
                          content: DateTimeHelper.formatDateTime(
                            state.clanData.data!.createdAt!,
                            format: "dd/MM/yyyy",
                          ),
                        ),
                        SizedBox(height: 16.h),
                        CPButton(
                          configs: CPButtonConfigs(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            textStyle: themeData.value.typo.t12Semibold,
                            content: "See details",
                            onTap: () {
                              // TODO: See details clan
                              Modular.to.pushNamed(
                                MainModule.getRoutePath(
                                    MainModuleEnum.clanDetail),
                                arguments: ClanDetailArgument(
                                    clanEntity: state.clanData.data),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Column(
                      children: [
                        Text(
                          "You don't have any clan",
                          textAlign: TextAlign.center,
                          style: themeData.value.typo.t12Bold.copyWith(),
                        ),
                        SizedBox(height: 10.h),
                        CPButton(
                          configs: CPButtonConfigs(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            textStyle: themeData.value.typo.t12Semibold,
                            content: "Create now",
                            onTap: () {
                              Modular.to.pushNamed(
                                MainModule.getRoutePath(
                                  MainModuleEnum.createClan,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
          default:
            return Column(
              children: [
                Text(
                  "You don't have any clan",
                  textAlign: TextAlign.center,
                  style: themeData.value.typo.t12Semibold.copyWith(),
                ),
                SizedBox(height: 20.h),
                CPButton(
                  configs: CPButtonConfigs(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    width: 200.w,
                    textStyle: themeData.value.typo.t12Semibold,
                    content: "Create now",
                    onTap: () {
                      Modular.to.pushNamed(
                        MainModule.getRoutePath(
                          MainModuleEnum.createClan,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            );
        }
      },
    );
  }

  Widget _buildSkeletonRow({required double width, required double height}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),
    );
  }

  Widget _buildClanDes({
    String? title,
    String? content,
  }) {
    return Row(
      children: [
        Text(
          title ?? "",
          textAlign: TextAlign.center,
          style: themeData.value.typo.t12Bold.copyWith(),
        ),
        SizedBox(width: 10.w),
        Text(
          content ?? "",
          textAlign: TextAlign.center,
          style: themeData.value.typo.t12Semibold.copyWith(),
        ),
      ],
    );
  }
}
