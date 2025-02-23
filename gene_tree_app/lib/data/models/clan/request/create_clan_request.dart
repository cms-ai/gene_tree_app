import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_clan_request.g.dart';

// @Freezed()
@JsonSerializable()
class CreateClanRequest {
  @JsonKey(name: 'clan_name')
  final String? clanName;
  final String? description;
  @JsonKey(name: 'author_id')
  final String authorId;

  CreateClanRequest({
    this.clanName,
    this.description,
    required this.authorId,
  });

  factory CreateClanRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateClanRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateClanRequestToJson(this);
}
