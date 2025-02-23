import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/domain/entities/clan_transaction_entity.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/common/components/cm_app_bar/cp_cm_app_bar.dart';
import 'package:gene_tree_app/modules/common/components/cm_dialog/cm_dialog_screen.dart';
import 'package:gene_tree_app/modules/common/components/cm_text_field/cp_cm_text_field.dart';
import './bloc/create_or_edit_trans_bloc.dart';
part './models/create_or_edit_trans_argument.dart';

class CreateOrEditTransScreen extends StatefulWidget {
  const CreateOrEditTransScreen({
    super.key,
    this.argument,
  });
  final CreateOrEditTransArgument? argument;

  @override
  State<CreateOrEditTransScreen> createState() =>
      _CreateOrEditTransScreenState();
}

class _CreateOrEditTransScreenState extends State<CreateOrEditTransScreen> {
  void handleTransBottomSheet(BuildContext context) {
    CmDialogScreen(
      argument: CmDialogArgument(
        type: CmDialogType.bottomSheet,
        bottomSheetConfigs: BottomSheetConfigs(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Chọn loại giao dịch",
                style: themeData.value.typo.t16Semibold.copyWith(),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ListView.separated(
                  itemCount: TransactionType.values.length,
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CPButton(
                      configs: CPButtonConfigs(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        content: TransactionType.values[index].name,
                        decoration: BoxDecoration(
                          color: index == 0
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

  @override
  Widget build(BuildContext context) {
    final CreateOrEditTransBloc bloc = Modular.get<CreateOrEditTransBloc>();

    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider.value(
          value: bloc,
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "CreateOrEditTrans",
              appBar: const CPCmAppBar(
                configs: CPCmAppBarConfigs(
                  title: "Transaction",
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
                          labelText: "Số tiền",
                          hintTextConfigs: HintTextConfigs(
                            hintText: "Nhập số tiền",
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
                          labelText: "Loại giao dịch",
                          type: CMTexFieldTypeEnum.pickOption,
                          hintTextConfigs: const HintTextConfigs(
                            hintText: "Chọn loại giao dịch",
                          ),
                          onSubmit: (onSubmit) {
                            handleTransBottomSheet(context);
                          },
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
}
