part of 'home_bloc.dart';

@immutable
sealed class HomeBlocState extends Equatable {
  List<TaskEntity>? get tasksLoaded;

  @override
  List<Object?> get props => [
        tasksLoaded,
      ];

  HomeBlocState copyWith({
    List<TaskEntity>? tasksLoaded,
  });
}

final class HomeBlocInitialState extends HomeBlocState {
  @override
  final List<TaskEntity>? tasksLoaded;

  HomeBlocInitialState({
    this.tasksLoaded,
  });

  @override
  HomeBlocState copyWith({
    tasksLoaded,
    localTasksLoaded,
  }) =>
      HomeBlocInitialState(
        tasksLoaded: tasksLoaded != [] ? tasksLoaded ?? this.tasksLoaded : null,
      );
}

final class HomeBlocLoadingState extends HomeBlocState {
  @override
  final List<TaskEntity>? tasksLoaded;

  HomeBlocLoadingState({
    this.tasksLoaded,
  });

  @override
  HomeBlocState copyWith({
    tasksLoaded,
    localTasksLoaded,
  }) =>
      HomeBlocLoadingState(
        tasksLoaded: tasksLoaded != [] ? tasksLoaded ?? this.tasksLoaded : null,
      );
}

final class HomeBlocLoadedState extends HomeBlocState {
  @override
  final List<TaskEntity>? tasksLoaded;

  HomeBlocLoadedState({
    this.tasksLoaded,
  });

  @override
  HomeBlocState copyWith({
    tasksLoaded,
    localTasksLoaded,
  }) =>
      HomeBlocLoadedState(
        tasksLoaded: tasksLoaded != [] ? tasksLoaded ?? this.tasksLoaded : null,
      );
}

final class HomeBlocErrorState extends HomeBlocState {
  @override
  final List<TaskEntity>? tasksLoaded;

  final String? errorMessage;

  HomeBlocErrorState({
    this.tasksLoaded,
    this.errorMessage,
  });

  @override
  HomeBlocState copyWith({
    tasksLoaded,
    localTasksLoaded,
    errorMessage,
  }) =>
      HomeBlocErrorState(
        tasksLoaded: tasksLoaded != [] ? tasksLoaded ?? this.tasksLoaded : null,
        errorMessage:
            errorMessage != '' ? errorMessage ?? this.errorMessage : null,
      );
}
