import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_clan_request.g.dart';

// @Freezed()
@JsonSerializable()
class UpdateClanRequest {
  @JsonKey(name: 'clan_name')
  final String? clanName;
  final String? description;

  UpdateClanRequest({
    this.clanName,
    this.description,
  });

  factory UpdateClanRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateClanRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateClanRequestToJson(this);
}
