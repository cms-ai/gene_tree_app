// lib/core/network/base_interceptor.dart

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gene_tree_app/core/utils/logger_utils.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Thêm các header mặc định hoặc xử lý trước khi gửi request
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';

    if (kDebugMode) {
      LoggerUtil.debugLog('Request: [${options.method}] ${options.uri}');
      LoggerUtil.debugLog('Headers: ${options.headers}');
      LoggerUtil.debugLog('Body: ${options.data}');
    }

    handler.next(options); // Tiếp tục thực hiện request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      LoggerUtil.infoLog(
          'Response: [${response.statusCode}] ${response.requestOptions.uri}');
      LoggerUtil.infoLog('Data: ${response.data}');
    }
    handler.next(response); // Trả response tiếp theo
  }

  @override
  void onError(err, handler) {
    if (kDebugMode) {
      LoggerUtil.errorLog(
          'Error: [${err.response?.statusCode}] ${err.requestOptions.uri}');
      LoggerUtil.errorLog('Message: ${err.message}');
    }

    handler.next(err); // Tiếp tục xử lý lỗi
  }
}
