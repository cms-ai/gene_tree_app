import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/modules/common/components/lottie/cp_lottie.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/models/enums/dashboard_enum.dart';
import 'package:gene_tree_app/core/utils/theme/models/app_theme_model.dart';
import './bloc/dashboard_bloc.dart';
part './models/dashboard_argument.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
    this.argument,
  });
  final DashboardArgument? argument;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final DashboardBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = Modular.get<DashboardBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider(
          lazy: false,
          create: (context) => _bloc,
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "Dashboard",
              body: (themeState) => BlocBuilder<DashboardBloc, DashboardState>(
                buildWhen: (previous, current) => previous.tab != current.tab,
                builder: (context, state) {
                  return IndexedStack(
                    index: state.tab.index,
                    children: [
                      ...DashboardTabEnum.values.map((e) => e.getBody()),
                    ],
                  );
                },
              ),
              bottomNavigationBar: (theme) => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: theme.appThemeEnum
                          .themeData()
                          .color
                          .bgColor2
                          .withOpacity(.7),
                      blurRadius: 4,
                      spreadRadius: 2,
                      offset: const Offset(4, 2),
                    )
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: BlocBuilder<DashboardBloc, DashboardState>(
                  buildWhen: (previous, current) => previous.tab != current.tab,
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...DashboardTabEnum.values.map(
                          (data) => _buildNavBarItem(
                            url: data.getIconPath(),
                            isSelected: state.tab == data,
                            onTap: () {
                              _bloc.add(
                                DashboardEvent.changeTab(data),
                              );
                            },
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavBarItem({
    required String url,
    required bool isSelected,
    required Function onTap,
  }) {
    return Expanded(
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          isSelected ? Colors.red.withOpacity(0.7) : Colors.black,
          BlendMode.srcATop,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: CPLottie(
                configs: CPLottieConfigs(
                  url: url,
                  height: 25.h,
                  onTap: (controller) {
                    onTap();
                    controller.forward(from: 0);
                  },
                ),
              ),
            ),
            Container(
              height: 5.h,
              margin: EdgeInsets.only(top: 2.h),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                width: isSelected ? 5.h : 0,
                height: isSelected ? 5.h : 0,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
