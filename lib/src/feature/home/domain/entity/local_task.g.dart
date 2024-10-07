// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalTaskEntity _$LocalTaskEntityFromJson(Map<String, dynamic> json) =>
    LocalTaskEntity(
      title: json['title'] as String?,
      completed: json['completed'] as bool?,
    );

Map<String, dynamic> _$LocalTaskEntityToJson(LocalTaskEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'completed': instance.completed,
    };
