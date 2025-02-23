import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import './bloc/forgot_password_bloc.dart';
part './models/forgot_password_argument.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({
    super.key,
    this.argument,
  });
  final ForgotPasswordArgument? argument;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldBuilder: () {
        return BaseScaffold(
          configs: BaseScaffoldConfigs(
            nameScreen: "Home",
            body: (themeState) => BlocProvider(
              create: (context) => ForgotPasswordBloc(),
              child: Container(),
            ),
          ),
        );
      },
    );
  }
}
