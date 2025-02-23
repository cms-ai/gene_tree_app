import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options); // Tiếp tục thực hiện request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response); // Trả response tiếp theo
  }

  @override
  void onError(err, handler) {
    handler.next(err); // Tiếp tục xử lý lỗi
  }
}
