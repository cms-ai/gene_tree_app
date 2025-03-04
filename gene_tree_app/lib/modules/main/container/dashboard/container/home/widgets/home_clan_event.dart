import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/domain/entities/clan_event_entity.dart';
import 'package:gene_tree_app/modules/common/components/event_item/cp_event_item.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/bloc/dashboard_bloc.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/container/home/bloc/home_bloc.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/models/enums/dashboard_enum.dart';
import 'package:gene_tree_app/modules/main/l10n/generated/l10n.dart';
import 'package:shimmer/shimmer.dart';

class HomeClanEvent extends StatefulWidget {
  final ThemeState themeState;
  const HomeClanEvent({
    super.key,
    required this.themeState,
  });

  @override
  State<HomeClanEvent> createState() => _HomeClanEventState();
}

class _HomeClanEventState extends State<HomeClanEvent> {
  final DashboardBloc dashboardBloc = Modular.get<DashboardBloc>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              MainLocalizations.current.event,
              style: themeData.value.typo.t16Bold.copyWith(
                color: themeData.value.color.mainPrimaryColor,
              ),
            ),
            const Spacer(),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                final status = state.clanEvents.status;
                return status == AsyncStatus.success
                    ? GestureDetector(
                        onTap: () {
                          dashboardBloc.add(
                            const DashboardEvent.changeTab(
                                DashboardTabEnum.event),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              MainLocalizations.current.viewAll,
                              style: themeData.value.typo.t10Bold.copyWith(
                                color:
                                    themeData.value.color.mainSecondaryColor1,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: themeData.value.color.mainSecondaryColor1,
                              size: 10.h,
                            )
                          ],
                        ),
                      )
                    : Container();
              },
            ),
          ],
        ),
        SizedBox(height: 10.h),
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final status = state.clanEvents.status;

            switch (status) {
              case AsyncStatus.loading:
                return Column(
                  children: [
                    ...List.generate(4, (index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          gradient: themeData.value.color.linegradientColor2,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title Skeleton
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: 150.w,
                                height: 10.h,
                                decoration: BoxDecoration(
                                  gradient:
                                      themeData.value.color.linegradientColor2,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                            ),
                            SizedBox(height: 6.h),
                            // Description Skeleton
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: double.infinity,
                                height: 8.h,
                                decoration: BoxDecoration(
                                  gradient:
                                      themeData.value.color.linegradientColor2,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                            ),
                            SizedBox(height: 6.h),
                            // Author and Time Skeleton
                            Row(
                              children: [
                                // Author Skeleton
                                Expanded(
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    child: Container(
                                      width: 100.w,
                                      height: 10.h,
                                      decoration: BoxDecoration(
                                        gradient: themeData
                                            .value.color.linegradientColor2,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    })
                  ],
                );
              case AsyncStatus.success:
                return ListView.separated(
                  itemBuilder: (context, index) => CPEventItem(
                    data: ClanEventEntity(),
                    configs: const CPEventItemConfigs(),
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10.h,
                  ),
                  itemCount: state.clanEvents.data?.length ?? 0,
                );

              default:
                return Column(
                  children: [
                    SizedBox(height: 60.h),
                    Text(
                      MainLocalizations.current.noClanDes,
                      textAlign: TextAlign.center,
                      style: themeData.value.typo.t12Semibold.copyWith(),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(height: 20.h),
                  ],
                );
            }
          },
        )
      ],
    );
  }
}
