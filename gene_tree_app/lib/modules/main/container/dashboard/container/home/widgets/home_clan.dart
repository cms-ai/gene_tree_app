import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/gen/assets.gen.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/main/container/clan/clan_detail/clan_detail_screen.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/container/home/bloc/home_bloc.dart';
import 'package:gene_tree_app/modules/main/l10n/generated/l10n.dart';
import 'package:gene_tree_app/modules/main/main_module.dart';
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
      buildWhen: (previous, current) => previous.clanData != current.clanData,
      builder: (context, state) {
        final status = state.clanData.status;
        switch (status) {
          case AsyncStatus.loading:
          case AsyncStatus.error:
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: double.infinity,
                height: 120.h,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            );
          case AsyncStatus.success:
            // Trường hợp chưa có clan
            if (state.clanData.data == null) return _buildEmptyClan();
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
              width: double.infinity,
              constraints: BoxConstraints(minHeight: 120.h),
              decoration: BoxDecoration(
                gradient: themeData.value.color.linegradientColor,
                image: DecorationImage(
                  image: AssetImage(
                    Assets.images.imageBg.path,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    state.clanData.data?.clanName ?? "",
                    style: themeData.value.typo.t16Bold.copyWith(
                      color: themeData.value.color.mainPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    state.clanData.data?.description ?? "",
                    textAlign: TextAlign.center,
                    style: themeData.value.typo.t10Regular.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CPButton(
                    configs: CPButtonConfigs(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      width: 200.w,
                      textStyle: themeData.value.typo.t12Semibold,
                      content: MainLocalizations.current.detail,
                      onTap: () {
                        Modular.to.pushNamed(
                          MainModule.getRoutePath(MainModuleEnum.clanDetail),
                          arguments: ClanDetailArgument(
                            clanEntity: state.clanData.data,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          default:
            return Container();
        }
      },
    );
  }

  Container _buildEmptyClan() {
    return Container();
  }
}
