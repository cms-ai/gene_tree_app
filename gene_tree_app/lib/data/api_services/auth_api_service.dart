// lib/data/data_sources/auth/auth_api_service.dart
import 'package:dio/dio.dart';
import 'package:gene_tree_app/core/network/base_response.dart';
import 'package:gene_tree_app/data/models/auth/login_google_request.dart';
import 'package:gene_tree_app/data/models/auth/login_google_response.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _AuthApiService;

  @POST("/auth/login-google")
  Future<BaseResponse<LoginGoogleResponse>> loginWithGoogle({
    @Body() LoginGoogleRequest? body,
  });
}
