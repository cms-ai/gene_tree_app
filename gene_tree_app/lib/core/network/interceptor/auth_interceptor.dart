import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_storage.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/core/utils/logger_utils.dart';
import 'package:gene_tree_app/data/models/auth/response/refesh_token_request.dart';
import 'package:gene_tree_app/domain/repositories/auth_repository.dart';
import 'package:gene_tree_app/domain/usecase/auth/refresh_token.usecase.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final LocalStorage localStorage;
  AuthInterceptor(
    this.dio,
    // this.authRepo,
    this.localStorage,
  );

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // final token = await SharePreferenceKeys.token.getData<String>() ?? "";
    final token =
        await localStorage.get<String>(SharePreferenceKeys.token.name) ?? "";

    // print("Token: $token");
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
        final AuthRepository authRepo = Modular.get();
        final result =
            await handleRefreshToken(authRepo); // Gọi hàm refresh token
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
      }
    }
    handler.next(err);
  }

  Future<bool> handleRefreshToken(AuthRepository authRepo) async {
    LoggerUtil.debugLog("Token expired");

    final refreshToken =
        await localStorage.get<String>(SharePreferenceKeys.refreshToken.name) ??
            "";
    if (refreshToken.isNotEmpty) {
      final response = await RefreshTokenUsecase(authRepo)
          .call(RefreshTokenRequest(refreshToken: refreshToken));
      final accesToken = response?.accessToken ?? "";
      if (accesToken.isNotEmpty) {
        LoggerUtil.debugLog("Refresh token success");
        await localStorage.save<String>(
            SharePreferenceKeys.token.name, accesToken);

        return true;
      } else {
        clearCacheLoginData();
      }
    }

    return false;
  }

  Future<void> clearCacheLoginData() async {
    await localStorage.remove(SharePreferenceKeys.token.name);
    await localStorage.remove(SharePreferenceKeys.refreshToken.name);
    await localStorage.remove(SharePreferenceKeys.userId.name);
  }
}
