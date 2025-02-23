import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/domain/entities/clan_event_entity.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/common/components/cm_app_bar/cp_cm_app_bar.dart';
import 'package:gene_tree_app/modules/common/components/cm_text_field/cp_cm_text_field.dart';
import 'package:gene_tree_app/modules/common/components/event_item/cp_event_item.dart';
import './bloc/clan_event_list_bloc.dart';
part './models/clan_event_list_argument.dart';

class ClanEventListScreen extends StatelessWidget {
  const ClanEventListScreen({
    super.key,
    this.argument,
  });
  final ClanEventListArgument? argument;

  @override
  Widget build(BuildContext context) {
    final ClanEventListBloc bloc = Modular.get<ClanEventListBloc>();
    const currentIndex = 0;
    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider.value(
          value: bloc,
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "ClanEventList",
              appBar: const CPCmAppBar(
                configs: CPCmAppBarConfigs(
                  title: "Event clan list",
                ),
              ),
              body: (themeState) => Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: themeData.value.spacing.screenHorizontal,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 14.h),
                    CPCmTextField(
                      configs: CPCmTextFieldConfigs(
                        controller: TextEditingController(),
                        type: CMTexFieldTypeEnum.search,
                        hintTextConfigs: HintTextConfigs(
                          hintText: "Search event...",
                          hintStyle: themeData.value.typo.t12Regular.copyWith(
                            color: themeData.value.color.mainPrimaryColor
                                .withOpacity(.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 6.h),
                        decoration: BoxDecoration(
                            color: themeData.value.color.btnColor2,
                            // .withOpacity(.05),
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Row(
                          children: [
                            ...List.generate(
                              EventStatutsEnum.values.length,
                              (index) => Expanded(
                                child: CPButton(
                                  configs: CPButtonConfigs(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 6.h, horizontal: 12.w),
                                    content: EventStatutsEnum.values[index]
                                        .toStatusString(),
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                      color: currentIndex == index
                                          ? themeData
                                              .value.color.mainSecondaryColor1
                                          : Colors.transparent,
                                      borderRadius:
                                          BorderRadius.circular(14.r), // Bo góc
                                    ),
                                    textStyle: themeData.value.typo.t10Semibold
                                        .copyWith(),
                                    onTap: () {},
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 3,
                        itemBuilder: (context, index) => CPEventItem(
                          data: ClanEventEntity(),
                          configs: const CPEventItemConfigs(),
                        ),
                        separatorBuilder: (
                          BuildContext context,
                          int index,
                        ) {
                          return SizedBox(height: 10.h);
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
}
