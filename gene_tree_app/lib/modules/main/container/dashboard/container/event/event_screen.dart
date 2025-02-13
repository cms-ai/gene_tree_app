import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/domain/entities/clan_event_entity.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/core/utils/theme/models/app_theme_model.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/common/components/cm_text_field/cp_cm_text_field.dart';
import '../../../../../../core/utils/helpers/helpers.dart';
import 'bloc/event_bloc.dart';
part 'models/event_argument.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({
    super.key,
    this.argument,
  });
  final EventArgument? argument;

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final EventBloc eventBloc = Modular.get();

  @override
  void initState() {
    super.initState();
    eventBloc.add(const EventEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider.value(
          value: eventBloc,
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "Event",
              body: (themeState) => Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: themeState.appThemeEnum
                      .themeData()
                      .spacing
                      .screenHorizontal,
                ),
                child: BlocBuilder<EventBloc, EventState>(
                  builder: (context, state) {
                    final dataList = state.clanEvents.data ?? [];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeader(themeState),
                        // SizedBox(
                        //   height: 40.h,
                        //   child: CPCmTextField(
                        //     configs: CPCmTextFieldConfigs(
                        //       hintTextConfigs: HintTextConfigs(
                        //         hintText: "Tìm sự kiện",
                        //         hintStyle: themeData.value.typo.t12Regular.copyWith(
                        //           color: Colors.grey,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 14.h),
                        Text(
                          "Total results (${dataList.length})",
                          style: themeData.value.typo.t14Semibold.copyWith(),
                        ),
                        SizedBox(height: 10.h),
                        Expanded(
                          child: ListView.separated(
                            itemCount: dataList.length,
                            itemBuilder: (context, index) => _buildEvent(
                              dataList[index],
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

  Widget _buildEvent(ClanEventEntity data) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      decoration: BoxDecoration(
        gradient: themeData.value.color.linegradientColor2,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.title ?? "",
            // textAlign: TextAlign.center,
            style: themeData.value.typo.t14Bold.copyWith(
              color: themeData.value.color.btnColor2,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            data.description ?? "",

            // textAlign: TextAlign.center,
            style: themeData.value.typo.t12Regular.copyWith(),
          ),
          SizedBox(height: 6.h),
          SizedBox(height: 6.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Author: ${data.author?.fullName}",
                  textAlign: TextAlign.start,
                  style: themeData.value.typo.t10Regular.copyWith(),
                ),
              ),
              RichText(
                text: TextSpan(
                  style: themeData.value.typo.t10Regular.copyWith(),
                  children: [
                    TextSpan(
                      text: DateTimeHelper.formatDateTime(
                        data.startDate ?? DateTime.now(),
                        format: "dd/MM/yyyy",
                      ),
                    ),
                    const TextSpan(text: " - "),
                    TextSpan(
                      text: DateTimeHelper.formatDateTime(
                        data.endDate ?? DateTime.now(),
                        format: "dd/MM/yyyy",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

extension _EventScreenStateExt on _EventScreenState {
  ///
  /// Header
  ///
  Widget _buildHeader(ThemeState themeState) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: themeState.appThemeEnum.themeData().spacing.screenVertical,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Event",
            style: themeState.appThemeEnum.themeData().typo.tHeader.copyWith(
                  fontWeight: FontWeight.w600,
                  color: themeData.value.color.btnColor2,
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
          // Container(
          //   padding: EdgeInsets.all(
          //     themeState.appThemeEnum.themeData().spacing.s6,
          //   ),
          //   decoration: BoxDecoration(
          //     color: themeState.appThemeEnum
          //         .themeData()
          //         .color
          //         .bgColor2
          //         .withOpacity(0.1),
          //     shape: BoxShape.circle,
          //   ),
          //   child: Stack(
          //     children: [
          //       Icon(
          //         Icons.filter_list_outlined,
          //         size: 18.h,
          //       ),
          //       Positioned(
          //         right: 0,
          //         top: 2,
          //         child: Container(
          //           width: 5.h,
          //           height: 5.h,
          //           decoration: const BoxDecoration(
          //             color: Colors.red,
          //             shape: BoxShape.circle,
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

  ///
  /// event today widget
  ///

  Widget _buildEventTodayList() {
    return Container();
  }
}
