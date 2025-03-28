import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/core/utils/helpers/helpers.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/modules/main/main_module.dart';
import 'package:gene_tree_app/modules/onboard/onboard_module.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import './bloc/splash_bloc.dart';
part './models/splash_argument.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
    this.argument,
  });
  final SplashArgument? argument;

  @override
  State<SplashScreen> createState() => _SplashScreenState();

  State<SplashScreen> get splashState => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ThemeBloc themeBloc = Modular.get();
  final SplashBloc splashBloc = Modular.get();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        splashBloc.add(const SplashEvent.started());
      });
    });
  }

  void _handleUnAuthenticated(bool firstLogin) {
    if (firstLogin) {
      Modular.to.navigate(
        OnboardModule.getRoutePath(OnboardModuleEnum.intro),
      );
    } else {
      Modular.to.navigate(
        OnboardModule.getRoutePath(OnboardModuleEnum.signIn),
      );
    }
  }

  void _handleAuthenticated(bool completedUser) {
    if (completedUser) {
      Modular.to.navigate(MainModule.path);
    } else {
      Modular.to.navigate(OnboardModule.getRoutePath(
        OnboardModuleEnum.profileSetup,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: splashBloc,
      child: BaseScreen(
        scaffoldBuilder: () {
          return BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "Splash screen",
              body: (themeState) => BlocListener<SplashBloc, SplashState>(
                listener: (context, state) {
                  state.map(
                    initial: (value) {},
                    unAuthenticated: (value) =>
                        _handleUnAuthenticated(value.firstLogin == true),
                    authenticated: (value) =>
                        _handleAuthenticated(value.completedUser == true),
                  );
                },
                listenWhen: (previous, current) => previous != current,
                child: Center(
                  child: ImageHelpers(themeEnum: themeState.appThemeEnum)
                      .getLogo(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
