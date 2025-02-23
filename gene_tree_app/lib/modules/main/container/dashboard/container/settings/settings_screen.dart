import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/common/components/cm_avatar/cp_cm_avatar.dart';
import 'package:gene_tree_app/modules/common/components/cm_toogle/cp_cm_toogle.dart';
import 'package:gene_tree_app/modules/main/main_module.dart';
import './bloc/settings_bloc.dart';
part './models/settings_argument.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
    this.argument,
  });
  final SettingsArgument? argument;

  @override
  Widget build(BuildContext context) {
    final SettingsBloc bloc = Modular.get<SettingsBloc>();

    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider.value(
          value: bloc,
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "Settings",
              body: (themeState) => Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: themeData.value.spacing.screenHorizontal,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildHeader(),
                      _buildProfile(),

                      // Options List
                      SizedBox(height: 20.h),
                      _buildOptionItem(
                        title: "My clan",
                        onTap: () {
                          Modular.to.pushNamed(
                            MainModule.getRoutePath(
                              MainModuleEnum.myClan,
                            ),
                          );
                        },
                      ),
                      _buildOptionItem(
                          title: "Language",
                          onTap: () {
                            Modular.to.pushNamed(
                              MainModule.getRoutePath(
                                MainModuleEnum.language,
                              ),
                            );
                          }),
                      _buildOptionItem(
                        title: "Dark mode",
                        suffixWidget: CPCmToogle(
                          configs: CPCmToogleConfigs(
                            isToogled: true,
                            onChange: (value) {},
                          ),
                        ),
                      ),
                      _buildOptionItem(
                        title: "Notification",
                        suffixWidget: CPCmToogle(
                          configs: CPCmToogleConfigs(
                            isToogled: true,
                            onChange: (value) {},
                          ),
                        ),
                      ),
                      _buildOptionItem(title: "About"),
                      _buildOptionItem(title: "Log out"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildOptionItem({
    String? title,
    Function? onTap,
    Widget? suffixWidget,
  }) {
    return GestureDetector(
      onTap: () => onTap != null ? onTap() : () {},
      child: Container(
        width: double.infinity,
        height: 50.h,
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          color: themeData.value.color.btnColor2,
          borderRadius: BorderRadius.circular(14.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title ?? "",
                style: themeData.value.typo.t12Semibold,
              ),
            ),
            suffixWidget ??
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18.h,
                  color: themeData.value.color.mainPrimaryColor,
                )
          ],
        ),
      ),
    );
  }

  Widget _buildProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CPCmAvatar(
          configs: CPCmAvatarConfigs(
            type: AvatarTypeEnum.network,
            size: 80.h,
            imageUrl: "",
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Trần Công Ái",
              style: themeData.value.typo.t16Bold.copyWith(),
            ),
            SizedBox(width: 4.w),
            Icon(
              Icons.edit_outlined,
              size: 20.h,
              color: themeData.value.color.mainPrimaryColor,
            )
          ],
        )
      ],
    );
  }

  Widget _buildHeader() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: themeData.value.spacing.screenVertical,
        ),
        child: Text(
          "Settings",
          textAlign: TextAlign.center,
          style: themeData.value.typo.t16Bold.copyWith(
            color: themeData.value.color.mainSecondaryColor1,
          ),
        ),
      ),
    );
  }
}
