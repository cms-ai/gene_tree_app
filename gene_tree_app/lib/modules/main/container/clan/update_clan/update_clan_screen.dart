import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/domain/entities/clan_entity.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/common/components/cm_app_bar/cp_cm_app_bar.dart';
import 'package:gene_tree_app/modules/common/components/cm_dialog/cm_dialog_screen.dart';
import 'package:gene_tree_app/modules/common/components/cm_text_field/cp_cm_text_field.dart';
import 'package:gene_tree_app/modules/main/main_module.dart';
import './bloc/update_clan_bloc.dart';
part './models/update_clan_argument.dart';

class UpdateClanScreen extends StatefulWidget {
  const UpdateClanScreen({
    super.key,
    this.argument,
  });
  final UpdateClanArgument? argument;

  @override
  State<UpdateClanScreen> createState() => _UpdateClanScreenState();
}

class _UpdateClanScreenState extends State<UpdateClanScreen> {
  late final TextEditingController nameController;
  late final TextEditingController desController;
  final UpdateClanBloc bloc = Modular.get<UpdateClanBloc>();

  @override
  void initState() {
    // print("===== ${bloc.isClosed}");
    nameController =
        TextEditingController(text: widget.argument?.clanEntity.clanName);
    desController =
        TextEditingController(text: widget.argument?.clanEntity.description);
    super.initState();

    bloc.stream.listen((value) async {
      await value.map(
        initial: (data) {},
        loading: (data) async {
          CmDialogScreen(
            argument: CmDialogArgument(type: CmDialogType.loading),
          ).show(context);
        },
        success: (data) async {
          CmDialogScreen(
            argument: CmDialogArgument(
              type: CmDialogType.success,
              onConfirm: () {
                Modular.to.popUntil(
                  ModalRoute.withName(MainModuleEnum.dashboard.path),
                );
              },
            ),
          ).show(context);
        },
        error: (error) {
          CmDialogScreen(
            argument: CmDialogArgument(
              type: CmDialogType.alert,
              title: error.title,
              content: error.content,
            ),
          ).show(context);
        },
      );
    });
  }

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
          value: bloc,
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "UpdateClan",
              appBar: CPCmAppBar(
                configs: CPCmAppBarConfigs(
                  title: "Update clan",
                  suffixWidget: GestureDetector(
                    onTap: () {
                      CmDialogScreen(
                        argument: CmDialogArgument(
                          type: CmDialogType.confirmation,
                          title: "Delete clan",
                          content:
                              "Bạn muốn xoá gia tộc ${widget.argument?.clanEntity.clanName}",
                          onConfirm: () {
                            bloc.add(
                              UpdateClanEvent.deleteClan(
                                  widget.argument?.clanEntity.id ?? ""),
                            );
                          },
                        ),
                      ).show(context);
                    },
                    child: const Icon(Icons.delete),
                  ),
                ),
              ),
              body: (themeState) => Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: themeData.value.spacing.screenHorizontal,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    CPCmTextField(
                      configs: CPCmTextFieldConfigs(
                        controller: nameController,
                        labelText: "Clan name",
                        hintTextConfigs: const HintTextConfigs(
                          hintText: "Enter your clan name ...",
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    CPCmTextField(
                      configs: CPCmTextFieldConfigs(
                        controller: desController,
                        labelText: "Description",
                        hintTextConfigs: const HintTextConfigs(
                          hintText: "Enter clan description ...",
                        ),
                      ),
                    ),
                    const Spacer(),
                    CPButton(
                      configs: CPButtonConfigs(
                        content: "Update",
                        onTap: () {
                          bloc.add(
                            UpdateClanEvent.submit(
                              clanId: widget.argument?.clanEntity.id ?? "",
                              nameClan: nameController.text.trim(),
                              description: desController.text.trim(),
                            ),
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
