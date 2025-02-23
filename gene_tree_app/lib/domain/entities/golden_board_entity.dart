import 'package:json_annotation/json_annotation.dart';

part 'golden_board_entity.g.dart';

@JsonSerializable()
class GoldenBoardEntity {
  final String id;

  @JsonKey(name: 'clan_id')
  final String clanId;

  @JsonKey(name: 'user_id')
  final String userId;

  final String title;
  final String? description;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  GoldenBoardEntity({
    required this.id,
    required this.clanId,
    required this.userId,
    required this.title,
    this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GoldenBoardEntity.fromJson(Map<String, dynamic> json) =>
      _$GoldenBoardEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GoldenBoardEntityToJson(this);
}
