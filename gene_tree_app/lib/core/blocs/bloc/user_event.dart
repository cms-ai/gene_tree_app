part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.started() = _Started;

  /// Được sử dụng khi khởi tạo data lúc đầu, hoặc new login
  const factory UserEvent.initialData() = _InitialData;
  const factory UserEvent.saveUserData(UserEntity? user) = _SaveUserData;
  const factory UserEvent.saveClanData(List<ClanEntity>? clan) = _SaveClanData;
}
