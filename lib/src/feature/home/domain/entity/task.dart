import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

List<TaskEntity> listEntityDataFromString(String jsonString) =>
    List<TaskEntity>.from(
        json.decode(jsonString).map((e) => TaskEntity.fromJson(e)));

@JsonSerializable()
class TaskEntity {
  final int? userId;
  final int? id;
  final String? title;
  final bool? completed;

  TaskEntity({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TaskEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TaskEntityToJson(this);
}
