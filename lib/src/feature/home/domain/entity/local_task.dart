import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'local_task.g.dart';

List<LocalTaskEntity> listLocalEntityDataFromString(String jsonString) =>
    List<LocalTaskEntity>.from(
        json.decode(jsonString).map((e) => LocalTaskEntity.fromJson(e)));

@JsonSerializable()
class LocalTaskEntity {
  final String? title;
  final bool? completed;

  LocalTaskEntity({
    required this.title,
    required this.completed,
  });

  factory LocalTaskEntity.fromJson(Map<String, dynamic> json) =>
      _$LocalTaskEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LocalTaskEntityToJson(this);
}
