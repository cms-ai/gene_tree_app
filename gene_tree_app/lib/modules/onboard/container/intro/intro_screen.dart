import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/gen/assets.gen.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/common/l10n/generated/l10n.dart';
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
      image: Assets.images.onboarding3.image(fit: BoxFit.cover),
      title: OnboardLocalizations.current.familyTraditionTitle,
      sub: OnboardLocalizations.current.familyTraditionContent,
    ),
    IntroItemModel(
      image: Assets.images.onboarding4.image(fit: BoxFit.cover),
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
            topSafeArea: false,
            body: (themeState) => BlocProvider(
              create: (context) => IntroBloc(),
              child: Container(
                color: const Color(0xFF202020),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                          return _buildPageItem(index, size);
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    _buildProgessWidget(),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CPButton(
                        configs: CPButtonConfigs(
                          content: indexPage >= itemList.length - 1
                              ? OnboardLocalizations.current.letStart
                              : CommonLocalizations.current.next,
                          textStyle: themeData.value.typo.t16Bold.copyWith(
                            color: Colors.white,
                          ),
                          onTap: () {
                            if (indexPage >= itemList.length - 1) {
                              Modular.to.navigate(
                                OnboardModule.getRoutePath(
                                  OnboardModuleEnum.signIn,
                                ),
                              );
                            } else {
                              controller.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPageItem(int index, Size size) {
    return SizedBox(
      height: double.infinity,
      child: Stack(
        children: [
          Positioned(
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [
                    const Color(0xFF202020),
                    const Color(0xFF202020).withOpacity(.95),
                    const Color(0xFF202020).withOpacity(.90),
                    const Color(0xFF202020).withOpacity(.85),
                    const Color(0xFFFFFFFF).withOpacity(0),
                  ],
                  stops: const [0, 0.16, 0.22, 0.32, 1],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: SizedBox(
                height: size.height * .7,
                width: double.infinity,
                child: itemList[index].image,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              // color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    itemList[index].title,
                    textAlign: TextAlign.center,
                    style: themeData.value.typo.t16Bold.copyWith(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: themeData.value.spacing.s18),
                  Text(
                    itemList[index].sub,
                    textAlign: TextAlign.center,
                    style: themeData.value.typo.t12Regular.copyWith(
                      color: const Color(0xFFFCFCFC),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProgessWidget() {
    return SizedBox(
      height: 30.w,
      width: double.infinity,
      child: Center(
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => AnimatedContainer(
            width: 30.w,
            height: 30.w,
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color:
                  index == indexPage ? Colors.white : const Color(0xFF404040),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                "${index + 1}",
                textAlign: TextAlign.center,
                style: themeData.value.typo.t12Semibold.copyWith(
                  color: index == indexPage ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 14.w,
              child: const Divider(
                color: Colors.white,
                thickness: 2,
                indent: 2,
                endIndent: 2,
              ),
            );
          },
          itemCount: itemList.length,
        ),
      ),
    );
  }
}
