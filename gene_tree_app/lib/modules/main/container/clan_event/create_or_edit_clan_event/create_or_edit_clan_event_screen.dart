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
import './bloc/create_or_edit_clan_event_bloc.dart';
part './models/create_or_edit_clan_event_argument.dart';

class CreateOrEditClanEventScreen extends StatelessWidget {
  const CreateOrEditClanEventScreen({
    super.key,
    this.argument,
  });
  final CreateOrEditClanEventArgument? argument;

  @override
  Widget build(BuildContext context) {
    final CreateOrEditClanEventBloc bloc =
        Modular.get<CreateOrEditClanEventBloc>();

    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider.value(
          value: bloc,
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "CreateOrEditClanEvent",
              appBar: const CPCmAppBar(
                configs: CPCmAppBarConfigs(
                  title: "Event",
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
                      const CPCmTextField(
                        configs: CPCmTextFieldConfigs(
                          type: CMTexFieldTypeEnum.datetime,
                          labelText: "Ngày mất",
                          hintTextConfigs: HintTextConfigs(
                            hintText: "dd//mm/yyyy",
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
