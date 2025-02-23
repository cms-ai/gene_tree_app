import 'package:gene_tree_app/core/network/base_response.dart';
import 'package:gene_tree_app/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<BaseResponse<UserEntity>> getUser(String userI);
  Future<BaseResponse<UserEntity>> updateUser(String userId);
  Future<BaseResponse<UserEntity>> deleteUser(String userId);
}
