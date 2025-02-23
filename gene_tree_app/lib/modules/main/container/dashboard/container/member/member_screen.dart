import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/core/utils/theme/models/app_theme_model.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/common/components/cm_member_clan_item/cp_cm_member_clan_item.dart';
import 'package:gene_tree_app/modules/common/components/cm_text_field/cp_cm_text_field.dart';
import 'package:gene_tree_app/modules/main/l10n/generated/l10n.dart';
import './bloc/member_bloc.dart';
part './models/member_argument.dart';

class MemberScreen extends StatefulWidget {
  const MemberScreen({
    super.key,
    this.argument,
  });
  final MemberArgument? argument;

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MemberBloc bloc = Modular.get<MemberBloc>();

    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider.value(
          value: bloc,
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "Member",
              body: (themeState) => Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: themeData.value.spacing.screenHorizontal,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(themeState),
                    CPCmTextField(
                      configs: CPCmTextFieldConfigs(
                        controller: controller,
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
                    SizedBox(height: 14.h),
                    Text(
                      "Total results (0)",
                      style: themeData.value.typo.t12Bold.copyWith(),
                    ),
                    SizedBox(height: 10.h),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 10,
                        itemBuilder: (context, index) => CPCmMemberClanItem(
                          configs: CPCmMemberClanItemConfigs(),
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

  Widget _buildHeader(ThemeState themeState) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: themeState.appThemeEnum.themeData().spacing.screenVertical,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            MainLocalizations.current.member,
            textAlign: TextAlign.center,
            style: themeData.value.typo.t16Bold.copyWith(
              color: themeData.value.color.mainSecondaryColor1,
            ),
          ),
          const Spacer(),
          CPButton(
            configs: CPButtonConfigs(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
              textStyle: themeData.value.typo.t12Semibold,
              content: "Add",
              onTap: () {
                // TODO: See details clan
              },
            ),
          ),
        ],
      ),
    );
  }
}
