import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/common/common_module.dart';
import 'package:gene_tree_app/modules/main/main_module.dart';
import 'package:gene_tree_app/modules/onboard/onboard_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CommonModule(),
        OnboardModule(),
      ];
  void initRoute() {
    Modular.setInitialRoute(OnboardModule.path);
  }

  @override
  void routes(RouteManager r) {
    r.module(OnboardModule.path, module: OnboardModule());
    r.module(MainModule.path, module: MainModule());

    super.routes(r);
  }
}
