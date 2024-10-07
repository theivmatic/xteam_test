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

  CheckTaskEvent({required this.taskId});
}

class DeleteTaskEvent extends HomeBlocEvent {
  final int? taskId;

  DeleteTaskEvent({required this.taskId});
}
