import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/app_bloc_observer.dart';
import 'package:gene_tree_app/app_module.dart';
import 'package:gene_tree_app/core/config/env_config.dart';
import 'package:gene_tree_app/core/utils/logger_utils.dart';
import 'package:gene_tree_app/my_app.dart';

// import 'firebase_options.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const String environment = String.fromEnvironment('env', defaultValue: 'dev');
  LoggerUtil.infoLog("ENIROMENT: $environment");
  await EnvConfig.loadEnv(environment);
  await Firebase.initializeApp();
  Bloc.observer = AppBlocObserver();

  // KHởi tạo router chạy đầu tiên
  AppModule().initRoute();

  // initialize singleton
  runApp(
    ModularApp(
      module: AppModule(),
      child: const MyApp(),
    ),
  );
}
