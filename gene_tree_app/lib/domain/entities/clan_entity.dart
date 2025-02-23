import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/domain/entities/user_entity.dart';

part 'clan_entity.freezed.dart';
part 'clan_entity.g.dart';

@freezed
class ClanEntity with _$ClanEntity {
  const factory ClanEntity({
    required String id,
    String? description,
    @JsonKey(name: "clan_name") String? clanName,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    UserEntity? author,
    @JsonKey(name: "clan_code") String? clanCode,
    @JsonKey(name: "members") List<dynamic>? members,
  }) = _ClanEntity;

  factory ClanEntity.fromJson(Map<String, dynamic> json) =>
      _$ClanEntityFromJson(json);
}
