import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/common/components/cm_app_bar/cp_cm_app_bar.dart';
import 'package:gene_tree_app/modules/common/components/cm_dialog/cm_dialog_screen.dart';
import 'package:gene_tree_app/modules/common/components/cm_member_clan_item/cp_cm_member_clan_item.dart';
import 'package:gene_tree_app/modules/common/components/cm_text_field/cp_cm_text_field.dart';
import './bloc/create_or_edit_golden_board_bloc.dart';
part './models/create_or_edit_golden_board_argument.dart';

class CreateOrEditGoldenBoardScreen extends StatelessWidget {
  const CreateOrEditGoldenBoardScreen({
    super.key,
    this.argument,
  });
  final CreateOrEditGoldenBoardArgument? argument;

  @override
  Widget build(BuildContext context) {
    final CreateOrEditGoldenBoardBloc bloc =
        Modular.get<CreateOrEditGoldenBoardBloc>();

    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider.value(
          value: bloc,
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "CreateOrEditGoldenBoard",
              appBar: const CPCmAppBar(
                configs: CPCmAppBarConfigs(
                  title: "Golden board",
                ),
              ),
              body: (themeState) => Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: themeData.value.spacing.screenHorizontal,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      const CPCmTextField(
                        configs: CPCmTextFieldConfigs(
                          labelText: "Tên sự kiện",
                          hintTextConfigs: HintTextConfigs(
                            hintText: "Nhập tên sự kiện...",
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      const CPCmTextField(
                        configs: CPCmTextFieldConfigs(
                          labelText: "Mô tả",
                          maxLines: 2,
                          hintTextConfigs: HintTextConfigs(
                            hintText: "Nhập mô tả",
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      CPCmTextField(
                        configs: CPCmTextFieldConfigs(
                          labelText: "Thành viên",
                          type: CMTexFieldTypeEnum.pickOption,
                          hintTextConfigs: HintTextConfigs(
                            hintText: "Chọn thành viên ",
                          ),
                          onSubmit: (onSubmit) {
                            handleUserBottomSheet(context);
                          },
                        ),
                      ),
                      SizedBox(height: 10.h),
                      CPCmTextField(
                        configs: CPCmTextFieldConfigs(
                          labelText: "Thời gian",
                          type: CMTexFieldTypeEnum.datetime,
                          hintTextConfigs: HintTextConfigs(
                            hintText: "Chọn thời gian",
                          ),
                          onSubmit: (onSubmit) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: (themeState) => Container(
                margin: EdgeInsets.symmetric(
                  horizontal: themeData.value.spacing.screenHorizontal,
                ),
                height: 80,
                child: Center(
                  child: CPButton(
                    configs: CPButtonConfigs(
                      height: 40.h,
                      content: "Create",
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

  void handleUserBottomSheet(BuildContext context) {
    CmDialogScreen(
      argument: CmDialogArgument(
        type: CmDialogType.bottomSheet,
        bottomSheetConfigs: BottomSheetConfigs(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Chọn member",
                style: themeData.value.typo.t16Semibold.copyWith(),
              ),
              SizedBox(height: 20.h),
              CPCmTextField(
                configs: CPCmTextFieldConfigs(
                  controller: TextEditingController(),
                  type: CMTexFieldTypeEnum.search,
                  hintTextConfigs: HintTextConfigs(
                    hintText: "Search member...",
                    hintStyle: themeData.value.typo.t12Regular.copyWith(
                      color: themeData.value.color.mainPrimaryColor
                          .withOpacity(.5),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CPCmMemberClanItem(
                      configs: CPCmMemberClanItemConfigs(
                        suffixWidget: Checkbox(
                          value: false,
                          checkColor: themeData.value.color.mainPrimaryColor,
                          activeColor: themeData.value.color.btnColor1,
                          onChanged: (bool? newValue) {},
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.h);
                  },
                  itemCount: 5,
                ),
              ),
              SizedBox(height: 20.h),
              CPButton(
                configs: CPButtonConfigs(
                  content: "Confirm",
                  decoration: BoxDecoration(
                    color:
                        themeData.value.color.btnColor1, // Màu nền của button
                    borderRadius: BorderRadius.circular(14.r), // Bo góc
                  ),
                  onTap: () {
                    Modular.to.pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ).show(context);
  }
}
