part of '../dashboard_screen.dart';

class DashboardArgument {
  final Future<ModularRoute?> Function(ModularRoute)? preNavigate;
  const DashboardArgument({
    this.preNavigate,
  });
}
