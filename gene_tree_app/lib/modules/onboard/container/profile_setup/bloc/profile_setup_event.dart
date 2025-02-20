part of 'profile_setup_bloc.dart';

@freezed
class ProfileSetupEvent with _$ProfileSetupEvent {
  const factory ProfileSetupEvent.started() = _Started;
  const factory ProfileSetupEvent.changeGender(GenderEnum gender) =
      _ChangeGender;
  const factory ProfileSetupEvent.onFullName(String fullName) = _OnFullName;
  const factory ProfileSetupEvent.onDOB(String dob) = _OnDOB;
  const factory ProfileSetupEvent.nextStep() = _ChangeStep;
  const factory ProfileSetupEvent.backStep() = _BackStep;
  const factory ProfileSetupEvent.changeDiableSubmitBtn(bool isDisable) =
      _ChangeDiableSubmitBtn;
  const factory ProfileSetupEvent.submit() = _Submit;
}
