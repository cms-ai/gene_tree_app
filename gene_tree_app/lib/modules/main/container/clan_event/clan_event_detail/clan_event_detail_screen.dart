import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/common/components/cm_app_bar/cp_cm_app_bar.dart';
import 'package:gene_tree_app/modules/common/components/cm_image/cp_cm_image.dart';
import './bloc/clan_event_detail_bloc.dart';
part './models/clan_event_detail_argument.dart';

class ClanEventDetailScreen extends StatelessWidget {
  const ClanEventDetailScreen({
    super.key,
    this.argument,
  });
  final ClanEventDetailArgument? argument;

  @override
  Widget build(BuildContext context) {
    final ClanEventDetailBloc bloc = Modular.get<ClanEventDetailBloc>();

    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider.value(
          value: bloc,
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "ClanEventDetail",
              appBar: const CPCmAppBar(
                configs: CPCmAppBarConfigs(
                  title: "Event detail",
                ),
              ),
              body: (themeState) => Container(
                padding: EdgeInsets.symmetric(
                    horizontal: themeData.value.spacing.screenHorizontal),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CPCmImage(
                        configs: CPCmImageConfigs(
                          type: ImageTypeEnum.network,
                          path: "",
                          width: double.infinity,
                          height: 140.h,
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Tên sự kiện",
                        style: themeData.value.typo.t16Bold.copyWith(
                          color: themeData.value.color.mainSecondaryColor1,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Start time",
                                  style:
                                      themeData.value.typo.t10Regular.copyWith(
                                    color: themeData
                                        .value.color.mainPrimaryColor
                                        .withOpacity(.5),
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  "yyyy-MM-dd",
                                  style:
                                      themeData.value.typo.t14Bold.copyWith(),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "End time",
                                  style:
                                      themeData.value.typo.t10Regular.copyWith(
                                    color: themeData
                                        .value.color.mainPrimaryColor
                                        .withOpacity(.5),
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  "yyyy-MM-dd",
                                  style:
                                      themeData.value.typo.t14Bold.copyWith(),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 14.h),
                      SizedBox(
                        width: double.infinity,
                        child: Divider(
                          color: themeData.value.color.mainPrimaryColor
                              .withOpacity(.5),
                          thickness: 2,
                          indent: 1,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "em Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          style: themeData.value.typo.t10Regular.copyWith(
                            color: themeData.value.color.mainPrimaryColor
                                .withOpacity(.5),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                      content: "Update",
                      onTap: () {
                        // TODO: Create clan member
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
