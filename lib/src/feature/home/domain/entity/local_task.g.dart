// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskEntity _$LocalTaskEntityFromJson(Map<String, dynamic> json) => TaskEntity(
      title: json['title'] as String?,
      completed: json['completed'] as bool?,
    );

Map<String, dynamic> _$LocalTaskEntityToJson(TaskEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'completed': instance.completed,
    };
