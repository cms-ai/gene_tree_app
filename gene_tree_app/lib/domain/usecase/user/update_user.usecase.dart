import 'package:gene_tree_app/data/models/user/request/update_user_request.dart';
import 'package:gene_tree_app/domain/entities/user_entity.dart';
import 'package:gene_tree_app/domain/repositories/user_repository.dart';

class UpdateUserUsecase {
  final UserRepository _userRepository;

  UpdateUserUsecase(this._userRepository);

  Future<UserEntity?> call(
    String userId, {
    UpdateUserRequest? body,
  }) async {
    final result = await _userRepository.updateUser(userId, body: body);
    return result.data;
  }
}
