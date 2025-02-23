import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refesh_token_response.g.dart';

// @Freezed()
@JsonSerializable()
class RefreshTokenResponse {
  @JsonKey(name: "access_token")
  final String accessToken;

  RefreshTokenResponse({
    required this.accessToken,
  });

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RefreshTokenResponseToJson(this);
}
