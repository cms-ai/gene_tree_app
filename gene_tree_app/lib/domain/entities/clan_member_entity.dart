import 'package:json_annotation/json_annotation.dart';

part 'clan_member_entity.g.dart';

enum RelationParentEnum {
  @JsonValue('FATHER')
  father,
  @JsonValue('MOTHER')
  mother,
  @JsonValue('OLDER_BROTHER')
  olderBrother,
  @JsonValue('YOUNGER_BROTHER')
  youngerBrother,
  @JsonValue('OLDER_SISTER')
  olderSister,
  @JsonValue('YOUNGER_SISTER')
  youngerSister,
  @JsonValue('SON')
  son,
  @JsonValue('DAUGHTER')
  daughter,
  @JsonValue('ADOPTED_SON')
  adoptedSon,
  @JsonValue('ADOPTED_DAUGHTER')
  adoptedDaughter,
}

extension RelationParentEnumExtension on RelationParentEnum {
  String get displayName {
    switch (this) {
      case RelationParentEnum.father:
        return 'Bố';
      case RelationParentEnum.mother:
        return 'Mẹ';
      case RelationParentEnum.olderBrother:
        return 'Anh trai';
      case RelationParentEnum.youngerBrother:
        return 'Em trai';
      case RelationParentEnum.olderSister:
        return 'Chị gái';
      case RelationParentEnum.youngerSister:
        return 'Em gái';
      case RelationParentEnum.son:
        return 'Con trai';
      case RelationParentEnum.daughter:
        return 'Con gái';
      case RelationParentEnum.adoptedSon:
        return 'Con trai nuôi';
      case RelationParentEnum.adoptedDaughter:
        return 'Con gái nuôi';
    }
  }
}

enum ClanRoleEnum {
  @JsonValue('CLAN_LEADER')
  clanLeader,
  @JsonValue('DEPUTY_CLAN_LEADER')
  deputyClanLeader,
  @JsonValue('ELDER')
  elder,
  @JsonValue('FIRST_BORN')
  firstBorn,
  @JsonValue('SECOND_BORN')
  secondBorn,
  @JsonValue('CLAN_MEMBER')
  clanMember,
  @JsonValue('HEIR')
  heir,
  @JsonValue('ELDER_ADVISOR')
  elderAdvisor,
  @JsonValue('YOUNGER_GEN')
  youngerGen,
}

@JsonSerializable()
class ClanMemberEntity {
  final String id;

  @JsonKey(name: 'clan_id')
  final String clanId;

  @JsonKey(name: 'user_id')
  final String? userId;

  final String name;

  final DateTime? dob;
  final String? address;

  @JsonKey(name: 'gender', unknownEnumValue: null)
  final String? gender;

  @JsonKey(name: 'relation_parent')
  final RelationParentEnum? relationParent;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @JsonKey(name: 'phone_number')
  final String? phoneNumber;

  @JsonKey(name: 'passed_away')
  final bool passedAway;

  final DateTime? dod;

  @JsonKey(name: 'resting_place')
  final String? restingPlace;

  @JsonKey(name: 'clan_role', unknownEnumValue: null)
  final ClanRoleEnum? clanRole;

  ClanMemberEntity({
    required this.id,
    required this.clanId,
    this.userId,
    required this.name,
    this.dob,
    this.address,
    this.gender,
    this.relationParent,
    required this.createdAt,
    required this.updatedAt,
    this.phoneNumber,
    required this.passedAway,
    this.dod,
    this.restingPlace,
    this.clanRole,
  });

  factory ClanMemberEntity.fromJson(Map<String, dynamic> json) =>
      _$ClanMemberEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ClanMemberEntityToJson(this);
}
