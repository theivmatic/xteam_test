part of 'home_bloc.dart';

@immutable
sealed class HomeBlocEvent {}

class FetchTasksEvent extends HomeBlocEvent {}

class AddTaskEvent extends HomeBlocEvent {
  final String title;
  final bool completed;

  AddTaskEvent({
    required this.title,
    required this.completed,
  });
}

class CheckTaskEvent extends HomeBlocEvent {
  final int? taskId;
  final int? index;
  final bool? completed;

  CheckTaskEvent({
    required this.taskId,
    required this.index,
    required this.completed,
  });
}

class DeleteTaskEvent extends HomeBlocEvent {
  final int? taskId;

  DeleteTaskEvent({required this.taskId});
}
