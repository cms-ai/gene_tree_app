part of 'theme_bloc.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState() = _ThemeState;

  factory ThemeState.initial() {
    return const ThemeState();
  }
}
