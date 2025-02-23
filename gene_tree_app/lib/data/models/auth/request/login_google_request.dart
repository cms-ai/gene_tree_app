import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_google_request.g.dart';

// @Freezed()
@JsonSerializable()
class LoginGoogleRequest {
  final String? email;
  final String? name;
  final String? avatarUrl;

  LoginGoogleRequest({
    this.email,
    this.name,
    this.avatarUrl,
  });

  factory LoginGoogleRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginGoogleRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginGoogleRequestToJson(this);
}
