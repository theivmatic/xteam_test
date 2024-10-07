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
