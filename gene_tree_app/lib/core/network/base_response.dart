import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  final int statusCode;
  final String messageCode;
  final String message;
  T? data;

  BaseResponse({
    required this.statusCode,
    required this.messageCode,
    required this.message,
    this.data,
  });

  // Factory method sử dụng để phân giải kiểu T từ JSON
  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT)..data = fromJsonT(json['data']);

  // Phương thức chuyển sang JSON
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, (value) => toJsonT(value))
        ..['data'] = toJsonT(data as T);
}
