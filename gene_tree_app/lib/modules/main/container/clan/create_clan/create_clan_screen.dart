import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/common/components/cm_app_bar/cp_cm_app_bar.dart';
import 'package:gene_tree_app/modules/common/components/cm_text_field/cp_cm_text_field.dart';
import './bloc/create_clan_bloc.dart';
part './models/create_clan_argument.dart';

class CreateClanScreen extends StatefulWidget {
  const CreateClanScreen({
    super.key,
    this.argument,
  });
  final CreateClanArgument? argument;

  @override
  State<CreateClanScreen> createState() => _CreateClanScreenState();
}

class _CreateClanScreenState extends State<CreateClanScreen> {
  final CreateClanBloc createClanBloc = Modular.get();
  final nameController = TextEditingController();
  final desController = TextEditingController();
  // final nameInput =
  @override
  void dispose() {
    nameController.dispose();
    desController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider.value(
          value: createClanBloc,
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "CreateClan",
              appBar: const CPCmAppBar(
                configs: CPCmAppBarConfigs(
                  title: "Create Clan",
                ),
              ),
              body: (themeState) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60.h),
                    Text(
                      "Tên gia tộc",
                      style: themeData.value.typo.t14Bold,
                    ),
                    SizedBox(height: 10.h),
                    CPCmTextField(
                      configs: CPCmTextFieldConfigs(
                        controller: nameController,
                        hintTextConfigs: const HintTextConfigs(
                          hintText: "Nhập tên gia tộc",
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      "Desciption",
                      style: themeData.value.typo.t14Bold,
                    ),
                    SizedBox(height: 10.h),
                    CPCmTextField(
                      configs: CPCmTextFieldConfigs(
                        controller: desController,
                        hintTextConfigs: const HintTextConfigs(
                          hintText: "Nhập mô tả",
                        ),
                      ),
                    ),
                    const Spacer(),
                    CPButton(
                      configs: CPButtonConfigs(
                        content: "Create",
                        onTap: () {
                          createClanBloc.add(
                            CreateClanEvent.createClanEvent(
                                name: nameController.text.trim(),
                                description: desController.text.trim()),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16.h)
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
