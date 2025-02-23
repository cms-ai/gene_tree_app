import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/domain/entities/clan_member_entity.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/common/components/cm_app_bar/cp_cm_app_bar.dart';
import 'package:gene_tree_app/modules/common/components/cm_dialog/cm_dialog_screen.dart';
import 'package:gene_tree_app/modules/common/components/cm_member_clan_item/cp_cm_member_clan_item.dart';
import 'package:gene_tree_app/modules/common/components/cm_text_field/cp_cm_text_field.dart';
import 'package:gene_tree_app/modules/common/components/cm_toogle/cp_cm_toogle.dart';
import './bloc/create_clan_member_bloc.dart';
part './models/create_clan_member_argument.dart';

enum PickUserStepEnum { chooseUser, chooseRelation }

class CreateClanMemberScreen extends StatefulWidget {
  const CreateClanMemberScreen({
    super.key,
    this.argument,
  });
  final CreateClanMemberArgument? argument;

  @override
  State<CreateClanMemberScreen> createState() => _CreateClanMemberScreenState();
}

class _CreateClanMemberScreenState extends State<CreateClanMemberScreen> {
  final CreateClanMemberBloc bloc = Modular.get<CreateClanMemberBloc>();
  final GenderEnum fakeCurrentGender = GenderEnum.MALE;
  final RelationParentEnum fakeRelationUser = RelationParentEnum.father;
  final memberController = TextEditingController();
  PickUserStepEnum selectedUser = PickUserStepEnum.chooseUser;
  final StreamController<PickUserStepEnum> _streamController =
      StreamController<PickUserStepEnum>.broadcast();
  PickUserStepEnum _currentStep = PickUserStepEnum.chooseUser;

  void showGenderBottomSheeet() {
    CmDialogScreen(
      argument: CmDialogArgument(
        type: CmDialogType.bottomSheet,
        bottomSheetConfigs: BottomSheetConfigs(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Chọn giới tính",
                style: themeData.value.typo.t16Semibold.copyWith(),
              ),
              SizedBox(height: 20.h),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CPButton(
                    configs: CPButtonConfigs(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      content: GenderEnum.values[index].name,
                      decoration: BoxDecoration(
                        color: fakeCurrentGender == GenderEnum.values[index]
                            ? themeData.value.color.btnColor1
                            : themeData
                                .value.color.btnColor2, // Màu nền của button
                        borderRadius: BorderRadius.circular(14.r), // Bo góc
                      ),
                      onTap: () {},
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10.h);
                },
                itemCount: GenderEnum.values.length,
              ),
              SizedBox(height: 20.h),
              const Spacer(),
              CPButton(
                configs: CPButtonConfigs(
                  content: "Confirm",
                  decoration: BoxDecoration(
                    color:
                        themeData.value.color.btnColor1, // Màu nền của button
                    borderRadius: BorderRadius.circular(14.r), // Bo góc
                  ),
                  onTap: () {
                    // Modular.to.pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ).show(context);
  }

  void handleUserBottomSheet() {
    _streamController.add(_currentStep);

    CmDialogScreen(
      argument: CmDialogArgument(
        type: CmDialogType.bottomSheet,
        bottomSheetConfigs: BottomSheetConfigs(
          child: StreamBuilder<PickUserStepEnum>(
              stream: _streamController.stream,
              builder: (context, snapshot) {
                PickUserStepEnum step =
                    snapshot.data ?? PickUserStepEnum.chooseUser;
                return step == PickUserStepEnum.chooseUser
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Chọn member",
                            style: themeData.value.typo.t16Semibold.copyWith(),
                          ),
                          SizedBox(height: 20.h),
                          CPCmTextField(
                            configs: CPCmTextFieldConfigs(
                              controller: memberController,
                              type: CMTexFieldTypeEnum.search,
                              hintTextConfigs: HintTextConfigs(
                                hintText: "Search member...",
                                hintStyle:
                                    themeData.value.typo.t12Regular.copyWith(
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
                                      checkColor: themeData
                                          .value.color.mainPrimaryColor,
                                      activeColor:
                                          themeData.value.color.btnColor1,
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
                                color: themeData.value.color
                                    .btnColor1, // Màu nền của button
                                borderRadius:
                                    BorderRadius.circular(14.r), // Bo góc
                              ),
                              onTap: () {
                                _streamController
                                    .add(PickUserStepEnum.chooseRelation);
                              },
                            ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Chọn mối quan hệ",
                            style: themeData.value.typo.t16Semibold.copyWith(),
                          ),
                          SizedBox(height: 20.h),
                          Expanded(
                            child: ListView.separated(
                              itemCount: RelationParentEnum.values.length,
                              shrinkWrap: true,
                              // physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CPButton(
                                  configs: CPButtonConfigs(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    content: RelationParentEnum
                                        .values[index].displayName,
                                    decoration: BoxDecoration(
                                      color: fakeRelationUser ==
                                              RelationParentEnum.values[index]
                                          ? themeData.value.color.btnColor1
                                          : themeData.value.color
                                              .btnColor2, // Màu nền của button
                                      borderRadius:
                                          BorderRadius.circular(14.r), // Bo góc
                                    ),
                                    onTap: () {},
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 10.h);
                              },
                            ),
                          ),
                          SizedBox(height: 20.h),
                          CPButton(
                            configs: CPButtonConfigs(
                              content: "Confirm",
                              decoration: BoxDecoration(
                                color: themeData.value.color
                                    .btnColor1, // Màu nền của button
                                borderRadius:
                                    BorderRadius.circular(14.r), // Bo góc
                              ),
                              onTap: () {
                                // Modular.to.pop();
                              },
                            ),
                          ),
                        ],
                      );
              }),
        ),
      ),
    ).show(context);
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider.value(
          value: bloc,
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "CreateClanMember",
              appBar: const CPCmAppBar(
                configs: CPCmAppBarConfigs(
                  title: "Create member",
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
                          labelText: "Fullname",
                          hintTextConfigs: HintTextConfigs(
                            hintText: "Nhập tên...",
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),

                      const CPCmTextField(
                        configs: CPCmTextFieldConfigs(
                          type: CMTexFieldTypeEnum.datetime,
                          labelText: "Ngày sinh",
                          hintTextConfigs: HintTextConfigs(
                            hintText: "dd//mm/yyyy",
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),

                      CPCmTextField(
                        configs: CPCmTextFieldConfigs(
                          type: CMTexFieldTypeEnum.pickOption,
                          labelText: "Giới tính",
                          hintTextConfigs: const HintTextConfigs(
                            hintText: "Chọn giới tính",
                          ),
                          onSubmit: (onSubmit) {
                            showGenderBottomSheeet();
                          },
                        ),
                      ),
                      SizedBox(height: 10.h),
                      // Tìm bố mẹ
                      SizedBox(height: 10.h),
                      CPCmTextField(
                        configs: CPCmTextFieldConfigs(
                          labelText: "Mối quan hệ",
                          type: CMTexFieldTypeEnum.pickOption,
                          hintTextConfigs: HintTextConfigs(
                            hintText: "Tìm user có mối quan hệ",
                          ),
                          onSubmit: (onSubmit) {
                            handleUserBottomSheet();
                          },
                        ),
                      ),

                      SizedBox(height: 10.h),
                      const CPCmTextField(
                        configs: CPCmTextFieldConfigs(
                          labelText: "Quê quán",
                          hintTextConfigs: const HintTextConfigs(
                            hintText: "Nhập quê quán",
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          const Spacer(),
                          CPCmToogle(
                            configs: CPCmToogleConfigs(
                              isToogled: true,
                              onChange: (value) {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      const CPCmTextField(
                        configs: CPCmTextFieldConfigs(
                          type: CMTexFieldTypeEnum.datetime,
                          labelText: "Ngày mất",
                          hintTextConfigs: HintTextConfigs(
                            hintText: "dd//mm/yyyy",
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),

                      const CPCmTextField(
                        configs: CPCmTextFieldConfigs(
                          labelText: "Nơi an nghỉ",
                          hintTextConfigs: const HintTextConfigs(
                            hintText: "Nhập nơi an nghỉ",
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
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
}
