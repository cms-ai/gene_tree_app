import 'package:flutter/material.dart';
import 'package:gene_tree_app/gen/assets.gen.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/container/event/event_screen.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/container/home/home_screen.dart';

enum DashboardTabEnum {
  home,
  event,
  // geneTree,
  member,
  profile,
}

extension DashboardEnumExt on DashboardTabEnum {
  String getIconPath() {
    switch (this) {
      case DashboardTabEnum.home:
        return Assets.gif.icHomeDark.path;
      case DashboardTabEnum.event:
        return Assets.gif.icCalendar.path;
      // case DashboardTabEnum.geneTree:
      //   return Assets.gif.icGeneDark.path;
      case DashboardTabEnum.member:
        return Assets.gif.icMember.path;
      case DashboardTabEnum.profile:
        return Assets.gif.icProfileDark.path;
    }
  }

  Widget getBody() {
    switch (this) {
      case DashboardTabEnum.home:
        return const HomeScreen();
      case DashboardTabEnum.event:
        return const EventScreen();
      default:
        return Center(
          child: Text(
            name,
            style: const TextStyle(color: Colors.red),
          ),
        );
    }
  }
}
