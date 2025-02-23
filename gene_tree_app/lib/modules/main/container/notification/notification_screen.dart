import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/common/components/cm_app_bar/cp_cm_app_bar.dart';
import 'package:gene_tree_app/modules/common/components/cm_avatar/cp_cm_avatar.dart';
import './bloc/notification_bloc.dart';
part './models/notification_argument.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({
    super.key,
    this.argument,
  });
  final NotificationArgument? argument;

  @override
  Widget build(BuildContext context) {
    final NotificationBloc bloc = Modular.get<NotificationBloc>();

    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider.value(
          value: bloc,
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "Notification",
              appBar: CPCmAppBar(
                configs: CPCmAppBarConfigs(
                  title: "Notification",
                  suffixWidget: Icon(
                    Icons.checklist_rtl_rounded,
                    color: themeData.value.color.mainSecondaryColor1,
                  ),
                ),
              ),
              body: (themeState) => ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => Container(
                  color: index == 0
                      ? themeData.value.color.mainSecondaryColor1
                          .withOpacity(.1)
                      : Colors.transparent,
                  padding: EdgeInsets.symmetric(
                      horizontal: themeData.value.spacing.screenHorizontal,
                      vertical: 10.h),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CPCmAvatar(
                            configs: CPCmAvatarConfigs(
                              type: AvatarTypeEnum.network,
                              size: 40.h,
                              imageUrl: "",
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Đây là là title của notification",
                                  maxLines: 1,
                                  style: themeData.value.typo.t12Semibold
                                      .copyWith(),
                                ),
                                Text(
                                  "10:00 18/02/2000",
                                  maxLines: 1,
                                  style:
                                      themeData.value.typo.t10Regular.copyWith(
                                    color: themeData
                                        .value.color.mainPrimaryColor
                                        .withOpacity(.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.more_horiz_outlined,
                            color: themeData.value.color.mainPrimaryColor,
                          )
                        ],
                      ),
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
}
