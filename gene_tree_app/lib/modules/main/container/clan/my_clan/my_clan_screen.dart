import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/common/components/cm_app_bar/cp_cm_app_bar.dart';
import 'package:gene_tree_app/modules/main/main_module.dart';
import './bloc/my_clan_bloc.dart';
part './models/my_clan_argument.dart';

class MyClanScreen extends StatelessWidget {
  const MyClanScreen({
    super.key,
    this.argument,
  });
  final MyClanArgument? argument;

  @override
  Widget build(BuildContext context) {
    final MyClanBloc bloc = Modular.get<MyClanBloc>();

    List<String> clanList = ["Họ trần", "Họ Nguyễn"];

    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider.value(
          value: bloc,
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "MyClan",
              appBar: const CPCmAppBar(
                configs: CPCmAppBarConfigs(
                  title: "My Clan",
                ),
              ),
              body: (themeState) => Container(
                padding: EdgeInsets.symmetric(
                    horizontal: themeData.value.spacing.screenHorizontal),
                child: Column(
                  children: [
                    ...List.generate(clanList.length, (index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: CPButton(
                          configs: CPButtonConfigs(
                            content: clanList[index],
                            type: ButtonType.outline,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: index == 0
                                      ? themeData.value.color.btnColor1
                                      : themeData.value.color
                                          .mainPrimaryColor // Màu viền của button
                                  ),
                              borderRadius:
                                  BorderRadius.circular(8.r), // Bo góc
                            ),
                            suffixWidget: index == 0
                                ? Container(
                                    padding: EdgeInsets.all(2.w),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: themeData.value.color.btnColor1,
                                        width: 2,
                                      ),
                                    ),
                                    child: Container(
                                      height: 10.h,
                                      width: 10.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: themeData.value.color.btnColor1,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            textStyle:
                                themeData.value.typo.t12Semibold.copyWith(
                              color: index == 0
                                  ? themeData.value.color.btnColor1
                                  : themeData.value.color.mainPrimaryColor,
                            ),
                            onTap: () => {},
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
              bottomNavigationBar: (themeState) => Container(
                // color: Colors.red,
                margin: EdgeInsets.symmetric(
                  horizontal: themeData.value.spacing.screenHorizontal,
                ),
                height: 80,
                child: Center(
                  child: CPButton(
                    configs: CPButtonConfigs(
                      height: 40.h,
                      content: "Create new clan",
                      onTap: () {
                        Modular.to.pushNamed(
                          MainModule.getRoutePath(
                            MainModuleEnum.createClan,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
