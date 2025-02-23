part of 'sign_in_bloc.dart';

enum SignInScreenState {
  initial,
  loading,
  success,
  failed,
}

@freezed
class SignInState with _$SignInState {
  const factory SignInState() = _SignInState;

  factory SignInState.initial() {
    return const SignInState();
  }

  /// State khi đang xử lý đăng nhập (loading)
  const factory SignInState.loading() = _Loading;

  /// State khi đăng nhập thành công
  const factory SignInState.success({
    required String userId, // Thông tin người dùng khi thành công
    required bool isCompletedProfile,
  }) = _Success;

  /// State khi đăng nhập thất bại
  const factory SignInState.failure({
    required String title, // Thông tin lỗi khi thất bại
    required String content, // Thông tin lỗi khi thất bại
  }) = _Failure;
}
