import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gene_tree_app/core/utils/logger_utils.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    LoggerUtil.debugLog('⚪️ Create: ${bloc.runtimeType}');
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    LoggerUtil.debugLog('🔵 Event: ${bloc.runtimeType}, $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    LoggerUtil.debugLog('🟡 Change: ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    LoggerUtil.debugLog('🟢 Transition: ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    LoggerUtil.debugLog('🔴 Error: ${bloc.runtimeType}, $error');
  }

  @override
  void onClose(BlocBase bloc) {
    LoggerUtil.debugLog('⚪️ Close: ${bloc.runtimeType}');
    super.onClose(bloc);
  }
}
