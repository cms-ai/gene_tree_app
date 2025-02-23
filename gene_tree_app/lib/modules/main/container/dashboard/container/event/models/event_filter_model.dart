import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_filter_model.freezed.dart';
part 'event_filter_model.g.dart';

@freezed
class EventFilterModel with _$EventFilterModel {
  const factory EventFilterModel() = _EventFilterModel;

  factory EventFilterModel.fromJson(Map<String, dynamic> json) => _$EventFilterModelFromJson(json);
}
