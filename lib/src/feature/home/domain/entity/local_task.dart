import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'local_task.g.dart';

List<TaskEntity> listLocalEntityDataFromString(String jsonString) =>
    List<TaskEntity>.from(
        json.decode(jsonString).map((e) => TaskEntity.fromJson(e)));

@JsonSerializable()
class TaskEntity {
  final String? title;
  final bool? completed;

  TaskEntity({
    required this.title,
    required this.completed,
  });

  factory TaskEntity.fromJson(Map<String, dynamic> json) =>
      _$LocalTaskEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LocalTaskEntityToJson(this);
}
