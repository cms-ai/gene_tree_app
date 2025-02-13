import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/common/components/cm_app_bar/cp_cm_app_bar.dart';
import 'package:gene_tree_app/modules/common/components/cm_text_field/cp_cm_text_field.dart';
import 'package:gene_tree_app/modules/common/components/cm_toogle/cp_cm_toogle.dart';
import './bloc/create_clan_member_bloc.dart';
part './models/create_clan_member_argument.dart';

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
                      Text(
                        "Fullname",
                        style: themeData.value.typo.t12Bold,
                      ),
                      SizedBox(height: 10.h),
                      const CPCmTextField(
                        configs: CPCmTextFieldConfigs(
                          hintTextConfigs: HintTextConfigs(
                            hintText: "Nhập tên...",
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Ngày sinh",
                        style: themeData.value.typo.t12Bold,
                      ),
                      SizedBox(height: 10.h),
                      const CPCmTextField(
                        configs: CPCmTextFieldConfigs(
                          hintTextConfigs: HintTextConfigs(
                            hintText: "Ngày sinh",
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text("Giới tính", style: themeData.value.typo.t12Bold),
                      SizedBox(height: 10.h),
                      const CPCmTextField(
                        configs: CPCmTextFieldConfigs(
                          hintTextConfigs: HintTextConfigs(
                            hintText: "Nhập giới tính",
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      // Tìm bố mẹ
                      Text("Mối quan hệ", style: themeData.value.typo.t12Bold),
                      SizedBox(height: 10.h),
                      const CPCmTextField(
                        configs: CPCmTextFieldConfigs(
                          hintTextConfigs: HintTextConfigs(
                            hintText: "Tìm user có mối quan hệ",
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text("Quê quán", style: themeData.value.typo.t12Bold),
                      SizedBox(height: 10.h),
                      const CPCmTextField(
                        configs: CPCmTextFieldConfigs(
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
                      Text("Ngày mất", style: themeData.value.typo.t12Bold),
                      SizedBox(height: 10.h),
                      const CPCmTextField(
                        configs: CPCmTextFieldConfigs(
                          hintTextConfigs: const HintTextConfigs(
                            hintText: "Nhập ngày mất",
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text("Nơi an nghỉ", style: themeData.value.typo.t12Bold),
                      SizedBox(height: 10.h),
                      const CPCmTextField(
                        configs: CPCmTextFieldConfigs(
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
