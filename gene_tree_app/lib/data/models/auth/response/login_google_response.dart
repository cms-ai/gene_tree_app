import 'package:gene_tree_app/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_google_response.g.dart';

@JsonSerializable()
class LoginGoogleResponse {
  @JsonKey(name: "access_token")
  final String accessToken;
  @JsonKey(name: "refresh_token")
  final String refreshToken;
  @JsonKey(name: 'user')
  final UserEntity user;

  LoginGoogleResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  // Phương thức factory để từ JSON chuyển thành LoginGoogleResponse
  factory LoginGoogleResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginGoogleResponseFromJson(json);

  // Phương thức để chuyển từ LoginGoogleResponse sang JSON
  Map<String, dynamic> toJson() => _$LoginGoogleResponseToJson(this);
}
