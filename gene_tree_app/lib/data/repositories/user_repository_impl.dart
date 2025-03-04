import 'package:gene_tree_app/core/network/base_response.dart';
import 'package:gene_tree_app/data/api_services/user_api_service.dart';
import 'package:gene_tree_app/data/models/user/request/update_user_request.dart';
import 'package:gene_tree_app/data/repositories/base_repository.dart';
import 'package:gene_tree_app/domain/entities/user_entity.dart';
import 'package:gene_tree_app/domain/repositories/user_repository.dart';
import 'package:retrofit/retrofit.dart';

class UserRepositoryImpl extends BaseRepository implements UserRepository {
  final UserApiService userApiService;
  UserRepositoryImpl(this.userApiService);

  @override
  Future<BaseResponse<UserEntity>> getUser(String userId) {
    return execute<BaseResponse<UserEntity>>(
      request: () => userApiService.getUser(userId),
      showLoading: true,
    );
  }

  @override
  Future<BaseResponse<UserEntity>> deleteUser(String userId) {
    return execute<BaseResponse<UserEntity>>(
      request: () => userApiService.deleteUser(userId),
      showLoading: true,
    );
  }

  @override
  Future<BaseResponse<UserEntity>> updateUser(
    String userId, {
    @Body() UpdateUserRequest? body,
  }) {
    return execute<BaseResponse<UserEntity>>(
      request: () => userApiService.updateUser(userId, body),
      showLoading: true,
    );
  }
}
