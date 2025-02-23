// lib/features/auth/data/models/user_model.dart

import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart'; // Thêm phần này để liên kết với file .g.dart

@JsonSerializable()
class UserEntity {
  final String? userId;
  final String? userName;
  final String? fullName;
  final String? description;
  final String? address;
  final String? dob;
  final GenderEnum? gender;
  final String? avatarUrl;
  final bool? isDeleted;

  UserEntity({
    this.userId,
    this.userName,
    this.fullName,
    this.description,
    this.address,
    this.dob,
    this.gender,
    this.avatarUrl,
    this.isDeleted,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
