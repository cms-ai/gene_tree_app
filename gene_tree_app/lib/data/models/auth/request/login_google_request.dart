import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_google_request.g.dart';

// @Freezed()
@JsonSerializable()
class LoginGoogleRequest {
  @JsonKey(name: 'id_token')
  final String idToken;

  LoginGoogleRequest({
    required this.idToken,
  });

  factory LoginGoogleRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginGoogleRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginGoogleRequestToJson(this);
}
