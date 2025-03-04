import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_user_request.g.dart';

@JsonSerializable()
class UpdateUserRequest {
  final String? fullName;
  final String? dob;
  final GenderEnum? gender;

  UpdateUserRequest({
    this.fullName,
    this.dob,
    this.gender,
  });

  factory UpdateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateUserRequestToJson(this);
}
