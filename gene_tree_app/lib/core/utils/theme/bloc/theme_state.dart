part of 'theme_bloc.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({
    required AppThemeEnum appThemeEnum,
    required Color mainColor,
  }) = _ThemeState;

  factory ThemeState.initial(
    AppThemeEnum appThemeEnum,
    Color mainColor,
  ) {
    return ThemeState(
      appThemeEnum: appThemeEnum,
      mainColor: mainColor,
    );
  }
}
