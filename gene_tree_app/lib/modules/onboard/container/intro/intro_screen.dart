import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/gen/assets.gen.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/onboard/l10n/generated/l10n.dart';
import 'package:gene_tree_app/modules/onboard/onboard_module.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import './bloc/intro_bloc.dart';
part './models/intro_argument.dart';
part './models/intro_item_model.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({
    super.key,
    this.argument,
  });
  final IntroArgument? argument;

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController controller = PageController();
  int indexPage = 0;
  final itemList = [
    IntroItemModel(
      image: Assets.images.onboarding1.image(fit: BoxFit.cover),
      title: OnboardLocalizations.current.familyOriginTitle,
      sub: OnboardLocalizations.current.familyOriginContent,
    ),
    IntroItemModel(
      image: Assets.images.onboarding2.image(fit: BoxFit.cover),
      title: OnboardLocalizations.current.familyTraditionTitle,
      sub: OnboardLocalizations.current.familyTraditionContent,
    ),
    IntroItemModel(
      image: Assets.images.onboarding1.image(fit: BoxFit.cover),
      title: OnboardLocalizations.current.familyFutureTitle,
      sub: OnboardLocalizations.current.familyFutureContent,
    ),
  ];
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BaseScreen(
      scaffoldBuilder: () {
        return BaseScaffold(
          configs: BaseScaffoldConfigs(
            nameScreen: "Intro",
            body: (themeState) => BlocProvider(
              create: (context) => IntroBloc(),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: controller,
                      itemCount: itemList.length,
                      onPageChanged: (value) {
                        indexPage = value;
                        setState(() {});
                      },
                      itemBuilder: (context, index) {
                        return _buildPageViewItem(
                          itemList[index],
                          index,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
                    child: indexPage >= itemList.length - 1
                        ? CPButton(
                            configs: CPButtonConfigs(
                              content: "Start",
                              width: size.width * 0.8,
                              onTap: () {
                                Modular.to.navigate(
                                  OnboardModule.getRoutePath(
                                    OnboardModuleEnum.signIn,
                                  ),
                                );
                              },
                            ),
                          )
                        : Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Modular.to.navigate(
                                    OnboardModule.getRoutePath(
                                      OnboardModuleEnum.signIn,
                                    ),
                                  );
                                },
                                child: Text(
                                  "Skip",
                                  textAlign: TextAlign.center,
                                  style: themeData.value.typo.t16Bold.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              CPButton(
                                configs: CPButtonConfigs(
                                  content: "Next",
                                  width: 100.w,
                                  onTap: () {
                                    controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  ///
  /// ======= Build method list ==========
  ///
  Widget _buildPageViewItem(
    IntroItemModel data,
    int index,
  ) {
    return SizedBox(
      key: ValueKey(index),
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(width: double.infinity, child: data.image),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      data.title,
                      textAlign: TextAlign.center,
                      style: themeData.value.typo.t16Semibold.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: themeData.value.spacing.s18,
                    ),
                    Text(
                      data.sub,
                      textAlign: TextAlign.center,
                      style: themeData.value.typo.t12Regular.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
