class NameAndAgeStepFormModel {
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

class ClanStepFormModel {
  final String clanName;
  final String clanDescription;
  ClanStepFormModel({
    this.clanName = "",
    this.clanDescription = "",
  });

  ClanStepFormModel copyWith({
    String? clanName,
    String? clanDescription,
  }) {
    return ClanStepFormModel(
      clanName: clanName ?? this.clanName,
      clanDescription: clanDescription ?? this.clanDescription,
    );
  }

  bool get isValid => clanName.isNotEmpty && clanDescription.isNotEmpty;
}
