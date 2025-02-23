import 'package:dio/dio.dart';
import 'package:gene_tree_app/core/config/env_config.dart';
import 'package:gene_tree_app/core/network/interceptor/exports.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_storage.dart';

class DioClient {
  final Dio _dio;
  final LocalStorage localStorage;
  DioClient({required this.localStorage})
      : _dio = Dio(BaseOptions(
          baseUrl: EnvConfig.getRequired(EnvKeys.BASE_URL),
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
        )) {
    _dio.interceptors.addAll(
      [
        AuthInterceptor(_dio, localStorage),
        LoggingInterceptor(),
        AppInterceptor(),
      ],
    );
  }

  Dio get dio => _dio;
}
