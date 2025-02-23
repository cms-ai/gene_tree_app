import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/common/components/cm_app_bar/cp_cm_app_bar.dart';
import 'package:gene_tree_app/modules/common/components/cm_avatar/cp_cm_avatar.dart';
import './bloc/golden_board_list_bloc.dart';
part './models/golden_board_list_argument.dart';

class GoldenBoardListScreen extends StatelessWidget {
  const GoldenBoardListScreen({
    super.key,
    this.argument,
  });
  final GoldenBoardListArgument? argument;

  @override
  Widget build(BuildContext context) {
    final GoldenBoardListBloc bloc = Modular.get<GoldenBoardListBloc>();

    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider.value(
          value: bloc,
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "GoldenBoardList",
              appBar: const CPCmAppBar(
                configs: CPCmAppBarConfigs(
                  title: "Golden board",
                ),
              ),
              body: (themeState) => Container(
                padding: EdgeInsets.symmetric(
                  horizontal: themeData.value.spacing.screenHorizontal,
                ),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CPCmAvatar(
                          configs: CPCmAvatarConfigs(
                            type: AvatarTypeEnum.network,
                            size: 60.h,
                            imageUrl: "",
                          ),
                        ),
                        Text(
                          "Trần Công Ái",
                          style: themeData.value.typo.t16Bold.copyWith(
                            color: themeData.value.color.mainSecondaryColor1,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Đạt giải  nhất cuộc thi tiếng Anh",
                          style: themeData.value.typo.t12Regular.copyWith(
                            color: themeData.value.color.mainPrimaryColor,
                          ),
                        ),
                        Text(
                          "Thời gian: 18/02/2024",
                          style: themeData.value.typo.t12Regular.copyWith(
                            color: themeData.value.color.mainPrimaryColor,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SizedBox(
                          width: double.infinity,
                          child: Divider(
                            color: themeData.value.color.mainPrimaryColor
                                .withOpacity(.5),
                            thickness: 2,
                            indent: 1,
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 10.h),
                  itemCount: 4,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
