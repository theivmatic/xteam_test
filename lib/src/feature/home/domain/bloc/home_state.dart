part of 'home_bloc.dart';

@immutable
sealed class HomeBlocState {}

final class HomeBlocInitialState extends HomeBlocState {}

final class HomeBlocLoadingState extends HomeBlocState {}

final class HomeBlocLoadedState extends HomeBlocState {
  final List<TaskEntity> tasksLoaded;

  HomeBlocLoadedState({required this.tasksLoaded});
}

final class HomeBlocErrorState extends HomeBlocState {
  final String errorMessage;

  HomeBlocErrorState({required this.errorMessage});
}
