import 'package:gene_tree_app/data/models/auth/response/refesh_token_request.dart';
import 'package:gene_tree_app/data/models/auth/response/refesh_token_response.dart';
import 'package:gene_tree_app/domain/repositories/auth_repository.dart';

class RefreshTokenUsecase {
  final AuthRepository _authRepository;

  RefreshTokenUsecase(this._authRepository);

  Future<RefreshTokenResponse?> call(RefreshTokenRequest data) async {
    final result = await _authRepository.refreshToken(data);
    return result.data;
  }
}
