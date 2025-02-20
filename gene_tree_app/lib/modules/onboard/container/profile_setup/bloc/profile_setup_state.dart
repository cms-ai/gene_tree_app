part of 'profile_setup_bloc.dart';

enum ProfileSetupStep {
  nameAndAge(true),
  gender(true),
  clan(false);

  final bool isRequired;
  const ProfileSetupStep(this.isRequired);
}

enum ProfileSetupStatusEnum {
  initial,
  loading,
  success,
  error,
}

@freezed
class ProfileSetupState with _$ProfileSetupState {
  const factory ProfileSetupState.initial({
    required NameAndAgeStepFormModel nameAndAgeStepFormModel,
    required ClanStepFormModel clanStepFormModel,
    required GenderEnum currentGender,
    required ProfileSetupStep currentStep,
    required bool isDisabledSubmit,
    required ProfileSetupStatusEnum profileSetupState,
  }) = _Initial;
}
