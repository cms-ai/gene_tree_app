// lib/data/data_sources/auth/auth_api_service.dart
import 'package:dio/dio.dart';
import 'package:gene_tree_app/core/network/base_response.dart';
import 'package:gene_tree_app/domain/entities/user_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api_service.g.dart';

@RestApi()
abstract class UserApiService {
  factory UserApiService(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _UserApiService;

  @GET("/user/{id}")
  Future<BaseResponse<UserEntity>> getUser(
    @Path('id') String id,
  );

  @PUT("/user/{id}")
  Future<BaseResponse<UserEntity>> updateUser(
    @Path('id') String id,
  );

  @DELETE("/user/{id}")
  Future<BaseResponse<UserEntity>> deleteUser(
    @Path('id') String id,
  );
}
