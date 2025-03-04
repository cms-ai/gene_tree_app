import 'package:gene_tree_app/core/utils/enums/enums.dart';

abstract class ProfileSetupStepModel {}

class NameAndAgeStepFormModel extends ProfileSetupStepModel {
  final String name;
  final String dateOfBirth;
  NameAndAgeStepFormModel({
    this.name = "",
    this.dateOfBirth = "",
  });

  NameAndAgeStepFormModel copyWith({
    String? name,
    String? dateOfBirth,
  }) {
    return NameAndAgeStepFormModel(
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }

  bool get isValid => name.isNotEmpty && dateOfBirth.isNotEmpty;
}

class GenderStepModel extends ProfileSetupStepModel {
  final GenderEnum? genderEnum;
  GenderStepModel({
    this.genderEnum,
  });

  GenderStepModel copyWith({GenderEnum? genderEnum}) {
    return GenderStepModel(
      genderEnum: genderEnum ?? this.genderEnum,
    );
  }

  bool get isValid => genderEnum != null;
}
