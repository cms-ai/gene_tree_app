part of 'intro_bloc.dart';

@freezed
class IntroState with _$IntroState {
  const factory IntroState() = _IntroState;

  factory IntroState.initial() {
    return const IntroState();
  }
}
