import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/modules/onboard/container/profile_setup/models/profile_setup_form_model.dart';

part 'profile_setup_event.dart';
part 'profile_setup_state.dart';
part 'profile_setup_bloc.freezed.dart';

class ProfileSetupBloc extends Bloc<ProfileSetupEvent, ProfileSetupState> {
  ProfileSetupBloc()
      : super(
          ProfileSetupState.initial(
            currentGender: GenderEnum.MALE,
            currentStep: ProfileSetupStep.nameAndAge,
            isDisabledSubmit: true,
            nameAndAgeStepFormModel: NameAndAgeStepFormModel(),
            clanStepFormModel: ClanStepFormModel(),
            profileSetupState: ProfileSetupStatusEnum.initial,
          ),
        ) {
    bool checkEnableNextButton() {
      switch (state.currentStep) {
        case ProfileSetupStep.nameAndAge:
          return state.nameAndAgeStepFormModel.name.isNotEmpty &&
              state.nameAndAgeStepFormModel.dateOfBirth.isNotEmpty;
        case ProfileSetupStep.clan:
        default:
          return true;
      }
    }

    on<ProfileSetupEvent>((event, emit) async {
      await event.map(
        started: (value) {},
        changeGender: (value) async {
          emit(state.copyWith(currentGender: value.gender));
        },
        nextStep: (_ChangeStep value) async {
          const stepList = ProfileSetupStep.values;
          final nextStep = state.currentStep.index + 1;
          if (nextStep >= stepList.length) {
            return;
          }
          late final bool isDisable;
          if (stepList[nextStep].isRequired) {
            isDisable = !checkEnableNextButton();
          } else {
            isDisable = false;
          }

          emit(
            state.copyWith(
              currentStep: ProfileSetupStep.values[nextStep],
              isDisabledSubmit: isDisable,
            ),
          );
         
        },
        backStep: (_BackStep value) {
          final backStep = state.currentStep.index - 1;
          if (backStep < 0) return;
          emit(state.copyWith(currentStep: ProfileSetupStep.values[backStep]));
        },
        changeDiableSubmitBtn: (_ChangeDiableSubmitBtn value) {
          emit(state.copyWith(isDisabledSubmit: value.isDisable));
        },
        onFullName: (_OnFullName value) {
          final newAgeAndNameModel =
              state.nameAndAgeStepFormModel.copyWith(name: value.fullName);
          emit(
            state.copyWith(
              nameAndAgeStepFormModel: newAgeAndNameModel,
              isDisabledSubmit: !checkEnableNextButton(),
            ),
          );
          final isDisable = !checkEnableNextButton();
          emit(state.copyWith(isDisabledSubmit: isDisable));
        },
        onDOB: (_OnDOB value) {
          final newAgeAndNameModel =
              state.nameAndAgeStepFormModel.copyWith(dateOfBirth: value.dob);
          emit(
            state.copyWith(
              nameAndAgeStepFormModel: newAgeAndNameModel,
            ),
          );
          final isDisable = !checkEnableNextButton();
          emit(state.copyWith(isDisabledSubmit: isDisable));
        },
        submit: (_Submit value) {
          emit(state.copyWith(
            profileSetupState: ProfileSetupStatusEnum.success,
          ));
        },
      );
    });
  }
}
