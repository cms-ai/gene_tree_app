import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/core/network/dio_client.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_keys.dart';
import 'package:gene_tree_app/core/utils/logger_utils.dart';
import 'package:gene_tree_app/data/models/auth/refesh_token_request.dart';
import 'package:gene_tree_app/domain/repositories/auth_repository.dart';
import 'package:gene_tree_app/domain/usecase/auth/refresh_token.usecase.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  AuthInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await SharePreferenceKeys.token.getData<String>() ?? "";
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    } else {
      options.headers['Authorization'] = '';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(err, handler) async {
    final responseData = err.response?.data;
    if (responseData is Map<String, dynamic>) {
      // Xử lý theo errorCode nếu cần
      if (responseData["errorCode"] == "INVALID_TOKEN") {
        print("============ INVALID_TOKEN");
        final result = await handleRefreshTokenn(); // Gọi hàm refresh token
        if (result) {
          handler.resolve(
            await dio.request(
              err.requestOptions.path,
              options: Options(
                method: err.requestOptions.method,
                headers: err.requestOptions.headers,
              ),
              data: err.requestOptions.data,
              queryParameters: err.requestOptions.queryParameters,
            ),
          );
          return;
        }
        ;
      }
    }
    handler.next(err);
  }

  Future<bool> handleRefreshTokenn() async {
    LoggerUtil.debugLog("Token experied");
    final AuthRepository authRepo = Modular.get();
    final refreshToken =
        await SharePreferenceKeys.refreshToken.getData<String>() ?? "";
    if (refreshToken.isNotEmpty) {
      final response = await RefreshTokenUsecase(authRepo)
          .call(RefreshTokenRequest(refreshToken: refreshToken));

      if ((response?.accessToken ?? "").isNotEmpty) {
        print("Refresh token success");
        await SharePreferenceKeys.token.saveData<String>(response!.accessToken);
        return true;
      } else {
        clearCacheLoginData();
      }
    }

    return false;
  }

  Future<void> clearCacheLoginData() async {
    await SharePreferenceKeys.token.removeData();
    await SharePreferenceKeys.refreshToken.removeData();
    await SharePreferenceKeys.userId.removeData();
  }
}
