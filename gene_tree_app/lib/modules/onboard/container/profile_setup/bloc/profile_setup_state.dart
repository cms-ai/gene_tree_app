part of 'profile_setup_bloc.dart';

enum ProfileSetupStep { nameAndAge, gender }

enum ProfileSetupStatusEnum {
  initial,
  loading,
  success,
  failure,
}

@freezed
class ProfileSetupState with _$ProfileSetupState {
  const factory ProfileSetupState.initial({
    NameAndAgeStepFormModel? nameAndAgeStepFormModel,
    GenderStepModel? genderStepModel,
    required ProfileSetupStep currentStep,
    required ProfileSetupStatusEnum profileSetupState,
  }) = _Initial;
}
