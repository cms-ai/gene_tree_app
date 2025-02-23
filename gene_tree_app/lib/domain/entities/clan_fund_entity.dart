import 'package:json_annotation/json_annotation.dart';

part 'clan_fund_entity.g.dart';

@JsonSerializable()
class ClanFundEntity {
  final String id;

  @JsonKey(name: 'clan_id')
  final String clanId;

  final double amount;

  @JsonKey(name: 'author_id')
  final String authorId;

  final String? description;

  @JsonKey(name: 'target_date')
  final DateTime? targetDate;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  ClanFundEntity({
    required this.id,
    required this.clanId,
    required this.amount,
    required this.authorId,
    this.description,
    this.targetDate,
    required this.createdAt,
  });

  factory ClanFundEntity.fromJson(Map<String, dynamic> json) =>
      _$ClanFundEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ClanFundEntityToJson(this);
}
