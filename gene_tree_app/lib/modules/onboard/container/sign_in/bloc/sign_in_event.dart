part of 'sign_in_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.initial() = _Initial;
  const factory SignInEvent.signInWithGoogle() = _SignInWithGoogle;
  const factory SignInEvent.signInWithApple() = _SignInWithApple;
}
