import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/helpers/helpers.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/domain/entities/clan_entity.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/modules/common/components/cm_app_bar/cp_cm_app_bar.dart';
import 'package:gene_tree_app/modules/common/components/cm_avatar/cp_cm_avatar.dart';
import 'package:gene_tree_app/modules/main/container/clan/update_clan/update_clan_screen.dart';
import 'package:gene_tree_app/modules/main/container/clan_member/clan_member_list/clan_member_list_screen.dart';
import 'package:gene_tree_app/modules/main/main_module.dart';
import './bloc/clan_detail_bloc.dart';
part './models/clan_detail_argument.dart';

class ClanDetailScreen extends StatefulWidget {
  const ClanDetailScreen({
    super.key,
    this.argument,
  });
  final ClanDetailArgument? argument;

  @override
  State<ClanDetailScreen> createState() => _ClanDetailScreenState();
}

class _ClanDetailScreenState extends State<ClanDetailScreen> {
  final ClanDetailBloc clanDetailBloc = Modular.get();

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [
      _buildClanOption(
          title: "Thành viên",
          onTap: () {
            Modular.to.pushNamed(
              MainModule.getRoutePath(MainModuleEnum.clanMemberList),
              arguments: ClanMemberListArgument(
                clanId: widget.argument?.clanEntity?.id ?? "",
              ),
            );
          }),
      _buildClanOption(title: "Bảng vàng", onTap: () {}),
      _buildClanOption(title: "Sự kiện", onTap: () {}),
      _buildClanOption(title: "Thu chi", onTap: () {}),
    ];

    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider.value(
          value: clanDetailBloc,
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "ClanDetail",
              appBar: CPCmAppBar(
                configs: CPCmAppBarConfigs(
                  title: "Clan detail",
                  suffixWidget: widget.argument?.clanEntity != null
                      ? GestureDetector(
                          onTap: () {
                            Modular.to.pushNamed(
                              MainModule.getRoutePath(
                                  MainModuleEnum.updateClan),
                              arguments: UpdateClanArgument(
                                clanEntity: widget.argument!.clanEntity!,
                              ),
                            );
                          },
                          child: const Icon(Icons.edit_rounded))
                      : Container(),
                ),
              ),
              body: (themeState) => Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: themeData.value.spacing.screenHorizontal,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CPCmAvatar(
                      configs: CPCmAvatarConfigs(
                        type: AvatarTypeEnum.network,
                        size: 60.h,
                        imageUrl: "",
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Gia tộc ${widget.argument?.clanEntity?.clanName}",
                          textAlign: TextAlign.center,
                          style: themeData.value.typo.t12Bold.copyWith(),
                        ),
                        SizedBox(width: 6.w),
                        Icon(
                          Icons.edit,
                          color: themeData.value.color.mainPrimaryColor,
                          size: 14.h,
                        )
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              color: themeData.value.color.btnColor2,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Ngày tạo",
                                  textAlign: TextAlign.center,
                                  style:
                                      themeData.value.typo.t12Semibold.copyWith(
                                    color:
                                        themeData.value.color.mainPrimaryColor,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  DateTimeHelper.formatDateTime(
                                    widget.argument?.clanEntity?.createdAt ??
                                        DateTime.now(),
                                    format: "dd/MM/yyyy",
                                  ),
                                  textAlign: TextAlign.center,
                                  style: themeData.value.typo.t12Regular
                                      .copyWith(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              color: themeData.value.color.btnColor2,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Author",
                                  textAlign: TextAlign.center,
                                  style: themeData.value.typo.t12Semibold,
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  widget.argument?.clanEntity?.author
                                          ?.fullName ??
                                      "",
                                  textAlign: TextAlign.center,
                                  style: themeData.value.typo.t12Regular,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // Số cột là 3
                          crossAxisSpacing: 10, // Khoảng cách giữa các cột
                          mainAxisSpacing: 10, // Khoảng cách giữa các hàng
                          mainAxisExtent: 60.h,
                        ),
                        itemCount: items.length,
                        primary: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return items[index];
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildClanOption({
    required String title,
    required Function onTap,
  }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: themeData.value.color.btnColor2,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: themeData.value.typo.t10Semibold,
        ),
      ),
    );
  }
}
