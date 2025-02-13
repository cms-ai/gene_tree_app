part of 'create_clan_member_bloc.dart';

@freezed
class CreateClanMemberEvent with _$CreateClanMemberEvent {
  const factory CreateClanMemberEvent.started() = _Started;
  const factory CreateClanMemberEvent.submitForm() = _SubmitForm;
}
