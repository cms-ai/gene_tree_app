import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/core/blocs/bloc/user_bloc.dart';
import 'package:gene_tree_app/modules/main/main_module.dart';

class ProfileGuard extends RouteGuard {
  final UserBloc userBloc;
  // final String? redirectPath;

  ProfileGuard({
    required this.userBloc,
  }) : super(redirectTo: null);

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    final userState = userBloc.state;
    if (userState.userData?.fullName == null ||
        userState.userData?.dob == null ||
        userState.userData?.gender == null ||
        userState.clanData != null) {
      return true;
    }
    // Đi tới màn hình custom
    Modular.to.navigate(MainModule.path);
    return false;
  }
}
