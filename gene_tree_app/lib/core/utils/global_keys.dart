import 'package:flutter/widgets.dart';

class GlobalKeys {
  static final GlobalKeys _instance = GlobalKeys._internal();
  factory GlobalKeys() => _instance;
  GlobalKeys._internal();
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}
