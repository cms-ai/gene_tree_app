part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial({
    /// User dc login hiện tại
    UserEntity? userData,

    /// Clan dc chọn hiện tại
    ClanEntity? clanData,
  }) = _Initial;
}
