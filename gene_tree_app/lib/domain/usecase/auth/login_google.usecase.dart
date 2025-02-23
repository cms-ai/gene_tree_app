import 'package:gene_tree_app/core/network/base_response.dart';
import 'package:gene_tree_app/data/models/auth/request/login_google_request.dart';
import 'package:gene_tree_app/data/models/auth/response/login_google_response.dart';
import 'package:gene_tree_app/data/repositories/base_repository.dart';
import 'package:gene_tree_app/domain/repositories/auth_repository.dart';

class LoginGoogleUsecase {
  final AuthRepository _authRepository;

  LoginGoogleUsecase(this._authRepository);

  Future<LoginGoogleResponse?> call(
    LoginGoogleRequest data, {
    OnExecuteDone<BaseResponse<LoginGoogleResponse>>? onExecuteDone,
    OnExecuteError? onExecuteError,
  }) async {
    final result = await _authRepository.loginGoogle(
      data,
      onExecuteError: onExecuteError,
      onExecuteDone: onExecuteDone,
    );
    return result.data;
  }
}
