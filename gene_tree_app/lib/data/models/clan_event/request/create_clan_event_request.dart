import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_clan_event_request.g.dart';

@JsonSerializable()
class CreateClanEventRequest {
  @JsonKey(name: 'clan_id')
  final String clanId;

  @JsonKey(name: 'title')
  final String? tile;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'author_id')
  final String authorId;

  @JsonKey(name: 'start_date')
  final DateTime startDate;

  @JsonKey(name: 'end_date')
  final DateTime endDate;

  CreateClanEventRequest({
    required this.clanId,
    this.tile,
    this.description,
    required this.authorId,
    required this.startDate,
    required this.endDate,
  });

  factory CreateClanEventRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateClanEventRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateClanEventRequestToJson(this);
}
