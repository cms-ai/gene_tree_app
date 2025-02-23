import 'package:gene_tree_app/core/network/base_response.dart';
import 'package:gene_tree_app/data/models/auth/request/login_google_request.dart';
import 'package:gene_tree_app/data/models/auth/response/login_google_response.dart';
import 'package:gene_tree_app/data/models/auth/response/refesh_token_request.dart';
import 'package:gene_tree_app/data/models/auth/response/refesh_token_response.dart';
import 'package:gene_tree_app/data/repositories/base_repository.dart';

abstract class AuthRepository {
  Future<BaseResponse<LoginGoogleResponse>> loginGoogle(
    LoginGoogleRequest data, {
    OnExecuteDone<BaseResponse<LoginGoogleResponse>>? onExecuteDone,
    OnExecuteError? onExecuteError,
  });
  Future<BaseResponse<RefreshTokenResponse>> refreshToken(
    RefreshTokenRequest data, {
    OnExecuteDone<BaseResponse<RefreshTokenResponse>>? onExecuteDone,
    OnExecuteError? onExecuteError,
  });
}
