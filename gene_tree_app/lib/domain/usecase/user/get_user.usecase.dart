import 'package:gene_tree_app/domain/entities/user_entity.dart';
import 'package:gene_tree_app/domain/repositories/user_repository.dart';

class GetUserUsecase {
  final UserRepository _userRepository;

  GetUserUsecase(this._userRepository);

  Future<UserEntity?> call(String userId) async {
    final result = await _userRepository.getUser(userId);
    return result.data;
  }
}
