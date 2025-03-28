import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/core/blocs/bloc/user_bloc.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_storage.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/core/utils/logger_utils.dart';
import 'package:gene_tree_app/data/models/user/request/update_user_request.dart';
import 'package:gene_tree_app/domain/usecase/user/update_user.usecase.dart';
import 'package:gene_tree_app/modules/onboard/container/profile_setup/models/profile_setup_form_model.dart';

part 'profile_setup_event.dart';
part 'profile_setup_state.dart';
part 'profile_setup_bloc.freezed.dart';

class ProfileSetupBloc extends Bloc<ProfileSetupEvent, ProfileSetupState> {
  final UserBloc userBloc;
  final UpdateUserUsecase updateUserUsecase;
  final LocalStorage localStorage;
  ProfileSetupBloc({
    required this.userBloc,
    required this.updateUserUsecase,
    required this.localStorage,
  }) : super(
          const ProfileSetupState.initial(
            currentStep: ProfileSetupStep.nameAndAge,
            profileSetupState: ProfileSetupStatusEnum.initial,
          ),
        ) {
    on<ProfileSetupEvent>((event, emit) async {
      await event.map(
        started: (value) async {
          ProfileSetupStep newStep = ProfileSetupStep.nameAndAge;
          if (value.nameAndAgeStepModel?.isValid == false) {
            newStep = ProfileSetupStep.nameAndAge;
          } else if (value.genderStepModel?.isValid == false) {
            newStep = ProfileSetupStep.gender;
          }

          emit(
            state.copyWith(
              nameAndAgeStepFormModel:
                  value.nameAndAgeStepModel ?? state.nameAndAgeStepFormModel,
              genderStepModel: value.genderStepModel,
              currentStep: newStep,
            ),
          );
        },
        submit: (value) async {
          if (state.profileSetupState == ProfileSetupStatusEnum.loading) return;
          emit(
            state.copyWith(
              profileSetupState: ProfileSetupStatusEnum.loading,
            ),
          );
          try {
            final userId =
                await localStorage.get<String>(SharePreferenceKeys.userId.name);

            final body = UpdateUserRequest(
              fullName: state.nameAndAgeStepFormModel?.name,
              dob: state.nameAndAgeStepFormModel?.dateOfBirth,
              // dob: DateTime.now().toString(),
              gender: state.genderStepModel?.genderEnum,
            );
            await updateUserUsecase.call(userId ?? "", body: body);

            emit(
              state.copyWith(
                profileSetupState: ProfileSetupStatusEnum.success,
              ),
            );
          } catch (e) {
            LoggerUtil.errorLog("$e");
            emit(
              state.copyWith(
                profileSetupState: ProfileSetupStatusEnum.failure,
              ),
            );
          }
        },
        onChange: (value) async {
          switch (state.currentStep) {
            case ProfileSetupStep.nameAndAge:
              emit(
                state.copyWith(
                  nameAndAgeStepFormModel: value.nameAndAgeStepModel,
                ),
              );
              break;
            case ProfileSetupStep.gender:
              emit(
                state.copyWith(
                  genderStepModel: value.genderStepModel,
                ),
              );
              break;
          }
        },
        nextStep: (value) async {
          final newIndexStep = state.currentStep.index + 1;
          if (newIndexStep >= ProfileSetupStep.values.length) return;
          emit(
            state.copyWith(
              currentStep: ProfileSetupStep.values[newIndexStep],
            ),
          );
        },
      );
    });
  }
}
