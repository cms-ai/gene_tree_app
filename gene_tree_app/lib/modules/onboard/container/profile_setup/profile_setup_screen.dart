import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/blocs/bloc/user_bloc.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/domain/entities/clan_entity.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/common/components/cm_app_bar/cp_cm_app_bar.dart';
import 'package:gene_tree_app/modules/common/components/cm_dialog/cm_dialog_screen.dart';
import 'package:gene_tree_app/modules/common/components/cm_text_field/cp_cm_text_field.dart';
import 'package:gene_tree_app/modules/common/l10n/generated/l10n.dart';
import 'package:gene_tree_app/modules/onboard/container/profile_setup/models/profile_setup_form_model.dart';
import 'package:gene_tree_app/modules/onboard/l10n/generated/l10n.dart';
import 'package:gene_tree_app/modules/onboard/onboard_module.dart';
import './bloc/profile_setup_bloc.dart';
part './models/profile_setup_argument.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({
    super.key,
    this.argument,
  });
  final ProfileSetupArgument? argument;

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  late final TextEditingController dateController;
  late final TextEditingController nameController;
  final ProfileSetupBloc bloc = Modular.get<ProfileSetupBloc>();
  final UserBloc userBloc = Modular.get<UserBloc>();
  @override
  void initState() {
    nameController =
        TextEditingController(text: userBloc.state.userData?.fullName);
    dateController = TextEditingController(text: userBloc.state.userData?.dob);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.add(
        ProfileSetupEvent.started(
          nameAndAgeStepModel: NameAndAgeStepFormModel(
            name: nameController.text.trim(),
            dateOfBirth: dateController.text.trim(),
          ),
          genderStepModel: GenderStepModel(
            genderEnum: userBloc.state.userData?.gender,
          ),
        ),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    dateController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider.value(
          value: bloc,
          child: BlocListener<ProfileSetupBloc, ProfileSetupState>(
            listenWhen: (previous, current) =>
                previous.profileSetupState != current.profileSetupState,
            listener: (context, state) {
              switch (state.profileSetupState) {
                case ProfileSetupStatusEnum.loading:
                  CmDialogScreen(
                    argument: CmDialogArgument(
                      type: CmDialogType.loading,
                    ),
                  ).show(context);
                  break;

                case ProfileSetupStatusEnum.failure:
                  CmDialogScreen(
                    argument: CmDialogArgument(
                      type: CmDialogType.alert,
                      title: "Error",
                      content: "Error",
                    ),
                  ).show(context);
                  break;
                case ProfileSetupStatusEnum.success:
                  CmDialogScreen(
                    argument: CmDialogArgument(
                      type: CmDialogType.success,
                    ),
                  ).show(context);
                  break;
                default:
                  break;
              }
            },
            child: BaseScaffold(
              configs: BaseScaffoldConfigs(
                nameScreen: "ProfileSetup",
                appBar: CPCmAppBar(
                  configs: CPCmAppBarConfigs(
                    title: "",
                    prefixIcon: GestureDetector(
                      onTap: () {
                        // bloc.add(const ProfileSetupEvent.backStep());
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: themeData.value.color.mainPrimaryColor,
                      ),
                    ),
                  ),
                ),
                body: (themeState) =>
                    BlocListener<ProfileSetupBloc, ProfileSetupState>(
                  listenWhen: (previous, current) =>
                      previous.profileSetupState != current.profileSetupState,
                  listener: (context, state) {
                    switch (state.profileSetupState) {
                      case ProfileSetupStatusEnum.loading:
                        CmDialogScreen(
                          argument: CmDialogArgument(
                            type: CmDialogType.loading,
                          ),
                        ).show(context);
                        break;

                      case ProfileSetupStatusEnum.failure:
                        CmDialogScreen(
                          argument: CmDialogArgument(
                            type: CmDialogType.alert,
                            title: "Error",
                            content: "Error",
                          ),
                        ).show(context);
                        break;
                      case ProfileSetupStatusEnum.success:
                        CmDialogScreen(
                          argument: CmDialogArgument(
                            type: CmDialogType.success,
                          ),
                        ).show(context);

                        Future.delayed(Duration(seconds: 2), () {
                          Modular.to.pushNamedAndRemoveUntil(
                            OnboardModule.getRoutePath(
                                OnboardModuleEnum.welcome),
                            (route) => false,
                          );
                        });
                        break;
                      default:
                        break;
                    }
                    // if (state.profileSetupState ==
                    //     ProfileSetupStatusEnum.success) {
                    //   // TODDO
                    //   // Navigate to welcome screen
                    //   Modular.to.pushNamedAndRemoveUntil(
                    //     OnboardModule.getRoutePath(OnboardModuleEnum.welcome),
                    //     (route) => false,
                    //   );
                    // }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: themeData.value.spacing.screenHorizontal,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  OnboardLocalizations.current.profileSetup,
                                  style: themeData.value.typo.t16Bold.copyWith(
                                    fontSize: 32.sp,
                                    color: themeData
                                        .value.color.mainSecondaryColor1,
                                  ),
                                ),
                                Text(
                                  OnboardLocalizations.current.profileSetupDes,
                                  style:
                                      themeData.value.typo.t14Regular.copyWith(
                                    color: themeData
                                        .value.color.mainSecondaryColor3,
                                  ),
                                ),
                                SizedBox(height: 22.h),
                                _buildProgessSetup(context),
                                SizedBox(height: 10.h),
                                _buildProfileWidget(),
                              ],
                            ),
                          ),
                        ),
                        _buildButton(),
                        SizedBox(height: 16.h)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // ProfileSetupStep getNextStep(ProfileSetupStep currentStep) {
  // switch (currentStep) {
  //   case ProfileSetupStep.nameAndAge:
  //     return ProfileSetupStep.gender;
  //   case

  // }
  // }

  Widget _buildButton() {
    return BlocBuilder<ProfileSetupBloc, ProfileSetupState>(
      builder: (context, state) {
        final buttonTitle = state.currentStep == ProfileSetupStep.values.last
            ? CommonLocalizations.current.submit
            : CommonLocalizations.current.next;

        bool enableButton() {
          switch (state.currentStep) {
            case ProfileSetupStep.nameAndAge:
              return state.nameAndAgeStepFormModel?.isValid ?? false;
            case ProfileSetupStep.gender:
              return state.genderStepModel?.isValid ?? false;
          }
        }

        return CPButton(
          configs: CPButtonConfigs(
            content: buttonTitle,
            isDiabled: !enableButton(),
            onTap: () {
              if (state.currentStep != ProfileSetupStep.values.last) {
                bloc.add(const ProfileSetupEvent.nextStep());
              } else {
                print("===================================");
                bloc.add(
                  const ProfileSetupEvent.submit(),
                );
              }
            },
          ),
        );
      },
    );
  }

  Widget _buildProfileWidget() {
    return BlocBuilder<ProfileSetupBloc, ProfileSetupState>(
      buildWhen: (previous, current) =>
          previous.currentStep != current.currentStep,
      builder: (context, state) {
        return IndexedStack(
          index: state.currentStep.index,
          children: [
            ...ProfileSetupStep.values.map((value) {
              switch (value) {
                case ProfileSetupStep.nameAndAge:
                  return _buildNameAndAgeWidget();
                case ProfileSetupStep.gender:
                  return _buildGenderWidget();
              }
            })
          ],
        );
      },
    );
  }

  Widget _buildGenderWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          CommonLocalizations.current.gender,
          style: themeData.value.typo.t16Bold.copyWith(
            fontSize: 22.sp,
            color: themeData.value.color.mainSecondaryColor1,
          ),
        ),
        SizedBox(height: 22.h),
        BlocBuilder<ProfileSetupBloc, ProfileSetupState>(
          buildWhen: (previous, current) =>
              previous.currentStep != current.currentStep ||
              previous.genderStepModel != current.genderStepModel,
          builder: (context, state) {
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return CPButton(
                  configs: CPButtonConfigs(
                    content: GenderEnum.values[index].name,
                    decoration: BoxDecoration(
                      color: state.genderStepModel?.genderEnum ==
                              GenderEnum.values[index]
                          ? themeData.value.color.btnColor1
                          : themeData
                              .value.color.btnColor2, // Màu nền của button
                      borderRadius: BorderRadius.circular(14.r), // Bo góc
                    ),
                    onTap: () {
                      bloc.add(
                        ProfileSetupEvent.onChange(
                          genderStepModel: GenderStepModel(
                            genderEnum: GenderEnum.values[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10.h);
              },
              itemCount: GenderEnum.values.length,
            );
          },
        ),
      ],
    );
  }

  Widget _buildNameAndAgeWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          OnboardLocalizations.current.nameAndAge,
          style: themeData.value.typo.t16Bold.copyWith(
            fontSize: 22.sp,
            color: themeData.value.color.mainSecondaryColor1,
          ),
        ),
        SizedBox(height: 22.h),
        CPCmTextField(
          configs: CPCmTextFieldConfigs(
            labelText: OnboardLocalizations.current.fullName,
            controller: nameController,
            onChanged: (value) {
              bloc.add(
                ProfileSetupEvent.onChange(
                  nameAndAgeStepModel: NameAndAgeStepFormModel(
                      name: nameController.text.trim(),
                      dateOfBirth: dateController.text.trim()),
                ),
              );
            },
            hintTextConfigs: HintTextConfigs(
              hintText: OnboardLocalizations.current.nameHint,
            ),
          ),
        ),
        SizedBox(height: 14.h),
        CPCmTextField(
          configs: CPCmTextFieldConfigs(
            type: CMTexFieldTypeEnum.datetime,
            labelText: OnboardLocalizations.current.dob,
            onChanged: (value) {
              bloc.add(
                ProfileSetupEvent.onChange(
                  nameAndAgeStepModel: NameAndAgeStepFormModel(
                    name: nameController.text.trim(),
                    dateOfBirth: dateController.text.trim(),
                  ),
                ),
              );
            },
            controller: dateController,
            hintTextConfigs: const HintTextConfigs(
              hintText: "yyyy-MM-dd",
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProgessSetup(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BlocBuilder<ProfileSetupBloc, ProfileSetupState>(
        buildWhen: (previous, current) =>
            previous.currentStep != current.currentStep,
        builder: (context, state) {
          int currentIndex = state.currentStep.index + 1;
          double mediumWidth =
              constraints.maxWidth / ProfileSetupStep.values.length;

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$currentIndex/${ProfileSetupStep.values.length}",
                style: themeData.value.typo.t12Regular.copyWith(
                  color: themeData.value.color.mainSecondaryColor3,
                ),
              ),
              SizedBox(height: 10.h),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F6F9),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  Align(
                    // right: constraints.maxWidth - mediumWidth * currentIndex,
                    alignment: Alignment.centerLeft,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: 6.h,
                      width: mediumWidth * currentIndex,
                      decoration: BoxDecoration(
                        gradient: themeData.value.color.linearBtnColor1,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  )
                ],
              )
            ],
          );
        },
      );
    });
  }
}
