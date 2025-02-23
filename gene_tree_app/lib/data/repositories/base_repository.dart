import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/core/exceptions/exceptions.dart';
import 'package:gene_tree_app/core/utils/logger_utils.dart';
import 'package:gene_tree_app/modules/common/bloc/bloc/app_bloc.dart';

typedef OnExecuteDone<T> = void Function(T response);
typedef OnExecuteError = void Function(ErrorResponse error);

class BaseRepository {
  Future<T> execute<T>({
    required Future<T> Function() request,
    OnExecuteDone<T>? onExecuteDone,
    OnExecuteError? onExecuteError,
    bool showLoading = false,
  }) async {
    try {
      if (showLoading) {
        LoggerUtil.debugLog("Loading started...");
      }

      final response = await request();
      onExecuteDone?.call(response);
      return response;
    } catch (error) {
      if (error is DioException && error.response?.data != null) {
        onExecuteError?.call(ErrorResponse.fromJson(error.response?.data));
      } else {
        final AppBloc appBloc = Modular.get();
        appBloc.add(AppEvent.showError(error));
      }

      rethrow;
    } finally {
      if (showLoading) {
        LoggerUtil.debugLog("Loading finished...");
      }
    }
  }
}
