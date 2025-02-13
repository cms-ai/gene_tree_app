import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/common/components/clan_member_card/cp_clan_member_card.dart';
import 'package:gene_tree_app/modules/common/components/cm_app_bar/cp_cm_app_bar.dart';
import 'package:gene_tree_app/modules/common/components/cm_text_field/cp_cm_text_field.dart';
import 'package:gene_tree_app/modules/main/main_module.dart';
import './bloc/clan_member_list_bloc.dart';
part './models/clan_member_list_argument.dart';

class ClanMemberListScreen extends StatefulWidget {
  const ClanMemberListScreen({
    super.key,
    this.argument,
  });
  final ClanMemberListArgument? argument;

  @override
  State<ClanMemberListScreen> createState() => _ClanMemberListScreenState();
}

class _ClanMemberListScreenState extends State<ClanMemberListScreen> {
  final controller = TextEditingController();
  final ClanMemberListBloc bloc = Modular.get<ClanMemberListBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(ClanMemberListEvent.started(widget.argument?.clanId ?? ""));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider.value(
          value: bloc,
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "ClanMemberList",
              appBar: const CPCmAppBar(
                configs: CPCmAppBarConfigs(
                  title: "Members",
                ),
              ),
              body: (themeState) =>
                  //  Container()
                  BlocBuilder<ClanMemberListBloc, ClanMemberListState>(
                buildWhen: (previous, current) =>
                    previous.members != current.members,
                builder: (context, state) {
                  final status = state.members.status;
                  switch (status) {
                    case AsyncStatus.loading:
                      return Center(
                        child: CircularProgressIndicator(
                          color: themeData.value.color.mainSecondaryColor1,
                        ),
                      );

                    case AsyncStatus.success:
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: themeData.value.spacing.screenHorizontal,
                          vertical: themeData.value.spacing.screenVertical,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Members (${state.members.data?.length})",
                              style: themeData.value.typo.t14Semibold.copyWith(
                                color: themeData.value.color.btnColor2,
                              ),
                            ),
                            SizedBox(height: 14.h),
                            CPCmTextField(
                              configs: CPCmTextFieldConfigs(
                                controller: controller,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 10.w),
                                hintTextConfigs: HintTextConfigs(
                                  hintText: "Tìm kiếm thành viên",
                                  hintStyle: themeData.value.typo.t12Regular.copyWith(
                                    color: themeData.value.color.mainPrimaryColor
                                        .withOpacity(.4),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            state.members.data?.isNotEmpty == true
                                ? Expanded(
                                    child: ListView.separated(
                                      itemCount:
                                          state.members.data?.length ?? 0,
                                      itemBuilder: (context, index) {
                                        return CPClanMemberCard(
                                          configs: CPClanMemberCardConfigs(
                                            state.members.data![index],
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return SizedBox(height: 6.h);
                                      },
                                    ),
                                  )
                                : Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "You don't have any members",
                                            style: themeData.value.typo.t14Semibold,
                                          ),
                                          SizedBox(height: 20.h),
                                          CPButton(
                                            configs: CPButtonConfigs(
                                              width: 200.w,
                                              padding: EdgeInsets.symmetric(
                                                vertical: 8.h,
                                                horizontal: 10.w,
                                              ),
                                              textStyle:
                                                  themeData.value.typo.t12Regular,
                                              content: "Create member",
                                              onTap: () {
                                                // TODO: Create now
                                                Modular.to.pushNamed(
                                                  MainModule.getRoutePath(
                                                    MainModuleEnum
                                                        .createClanMember,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                          ],
                        ),
                      );
                    default:
                      return Container();
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
