import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/core/utils/helpers/helpers.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/core/utils/theme/models/app_theme_model.dart';
import 'package:gene_tree_app/domain/entities/clan_event_entity.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/bloc/dashboard_bloc.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/container/home/bloc/home_bloc.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/models/enums/dashboard_enum.dart';
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
              "Event",
              style: themeData.value.typo.t14Bold.copyWith(
                color: themeData.value.color.btnColor2,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                // TODO: See all event
                dashboardBloc.add(
                  const DashboardEvent.changeTab(DashboardTabEnum.event),
                );
              },
              child: Row(
                children: [
                  Text(
                    "See all",
                    style: themeData.value.typo.t12Semibold.copyWith(
                      color: themeData.value.color.btnColor2,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: themeData.value.color.btnColor2,
                    size: 10.h,
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
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
                            horizontal: 20.w, vertical: 14.h),
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
                                height: 14.h,
                                decoration: BoxDecoration(
                                  gradient: themeData.value.color.linegradientColor2,
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
                                height: 12.h,
                                decoration: BoxDecoration(
                                  gradient: themeData.value.color.linegradientColor2,
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
                                        gradient:
                                            themeData.value.color.linegradientColor2,
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
                return Column(
                  children: [
                    ...(state.clanEvents.data ?? []).map(
                      (data) => _buildEventItem(data),
                    ),
                  ],
                );
              default:
                return Column(
                  children: [
                    SizedBox(height: 60.h),
                    Text(
                      "You don't have any clan events",
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

  Widget _buildEventItem(ClanEventEntity data) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      decoration: BoxDecoration(
        gradient: themeData.value.color.linegradientColor2,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.title ?? "",
            // textAlign: TextAlign.center,
            style: themeData.value.typo.t14Bold.copyWith(
              color: themeData.value.color.btnColor2,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            data.description ?? "",
            style: themeData.value.typo.t12Regular.copyWith(),
          ),
          SizedBox(height: 6.h),
          SizedBox(height: 6.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Author: ${data.author?.fullName}",
                  textAlign: TextAlign.start,
                  style: themeData.value.typo.t10Regular.copyWith(),
                ),
              ),
              RichText(
                text: TextSpan(
                  style: themeData.value.typo.t10Regular.copyWith(),
                  children: [
                    TextSpan(
                      text: DateTimeHelper.formatDateTime(
                        data.startDate ?? DateTime.now(),
                        format: "dd/MM/yyyy",
                      ),
                    ),
                    const TextSpan(text: " - "),
                    TextSpan(
                      text: DateTimeHelper.formatDateTime(
                        data.endDate ?? DateTime.now(),
                        format: "dd/MM/yyyy",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
