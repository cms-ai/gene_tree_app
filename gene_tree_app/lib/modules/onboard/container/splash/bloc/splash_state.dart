part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;

  const factory SplashState.unAuthenticated({
    required bool firstLogin,
  }) = _UnAuthenticated;

  const factory SplashState.authenticated({
    required bool completedUser,
  }) = _Authenticated;
}
