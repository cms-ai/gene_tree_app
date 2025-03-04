part of 'profile_setup_bloc.dart';

@freezed
class ProfileSetupEvent with _$ProfileSetupEvent {
  const factory ProfileSetupEvent.started({
    NameAndAgeStepFormModel? nameAndAgeStepModel,
    GenderStepModel? genderStepModel,
  }) = _Started;

  const factory ProfileSetupEvent.onChange({
    NameAndAgeStepFormModel? nameAndAgeStepModel,
    GenderStepModel? genderStepModel,
  }) = _OnChange;

  const factory ProfileSetupEvent.nextStep() = _NextStep;

  const factory ProfileSetupEvent.submit() = _Submit;
}
