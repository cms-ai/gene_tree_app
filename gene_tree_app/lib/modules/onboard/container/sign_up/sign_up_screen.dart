import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/gen/assets.gen.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/modules/common/components/cm_text_field/cp_cm_text_field.dart';
import 'package:gene_tree_app/modules/onboard/l10n/generated/l10n.dart';
import 'package:gene_tree_app/modules/onboard/onboard_module.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/core/utils/theme/models/app_theme_model.dart';
import './bloc/sign_up_bloc.dart';
part './models/sign_up_argument.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    super.key,
    this.argument,
  });
  final SignUpArgument? argument;

  @override
  Widget build(BuildContext context) {
    final SignUpBloc bloc = Modular.get<SignUpBloc>();
    return BaseScreen(
      scaffoldBuilder: () {
        return BaseScaffold(
          configs: BaseScaffoldConfigs(
            nameScreen: "Home",
            body: (themeState) => BlocProvider(
              create: (context) => bloc,
              child: Container(
                height: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: themeData.value.spacing.screenHorizontal),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    themeState.appThemeEnum == AppThemeEnum.darkTheme
                        ? Assets.images.darkLogo.svg(height: 40.h)
                        : Assets.images.lightLogo.svg(height: 40.h),
                    SizedBox(height: 30.h),
                    CPCmTextField(
                      configs: CPCmTextFieldConfigs(
                        hintTextConfigs: HintTextConfigs(
                          hintText: OnboardLocalizations.current.enterEmailHint,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CPCmTextField(
                      configs: CPCmTextFieldConfigs(
                        hintTextConfigs: HintTextConfigs(
                          hintText: OnboardLocalizations.current.enterPassHint,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CPCmTextField(
                      configs: CPCmTextFieldConfigs(
                        hintTextConfigs: HintTextConfigs(
                          hintText:
                              OnboardLocalizations.current.reEnterPassHint,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: themeState.mainColor,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Center(
                        child: Text(
                          OnboardLocalizations.current.signUp,
                          style: themeData.value.typo.t14Semibold.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    const Spacer(),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: OnboardLocalizations.current.haveAcountBefore,
                            style: themeData.value.typo.t12Regular.copyWith(),
                          ),
                          TextSpan(
                              text: " ${OnboardLocalizations.current.signIn}",
                              style: themeData.value.typo.t12Bold.copyWith(
                                color: themeState.mainColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Modular.to.navigate(
                                    OnboardModule.getRoutePath(
                                        OnboardModuleEnum.signIn),
                                  );
                                })
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
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
