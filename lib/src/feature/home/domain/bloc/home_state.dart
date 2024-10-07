part of 'home_bloc.dart';

@immutable
sealed class HomeBlocState extends Equatable {
  List<TaskEntity>? get tasksLoaded;
  List<LocalTaskEntity>? get localTasksLoaded;

  @override
  List<Object?> get props => [
        tasksLoaded,
        localTasksLoaded,
      ];

  HomeBlocState copyWith({
    List<TaskEntity>? tasksLoaded,
    List<LocalTaskEntity>? localTasksLoaded,
  });
}

final class HomeBlocInitialState extends HomeBlocState {
  @override
  final List<TaskEntity>? tasksLoaded;
  @override
  final List<LocalTaskEntity>? localTasksLoaded;

  HomeBlocInitialState({
    this.tasksLoaded,
    this.localTasksLoaded,
  });

  @override
  HomeBlocState copyWith({
    tasksLoaded,
    localTasksLoaded,
  }) =>
      HomeBlocInitialState(
        tasksLoaded: tasksLoaded != '' ? tasksLoaded ?? this.tasksLoaded : null,
        localTasksLoaded: localTasksLoaded != ''
            ? localTasksLoaded ?? this.localTasksLoaded
            : null,
      );
}

final class HomeBlocLoadingState extends HomeBlocState {
  @override
  final List<TaskEntity>? tasksLoaded;
  @override
  final List<LocalTaskEntity>? localTasksLoaded;

  HomeBlocLoadingState({
    this.tasksLoaded,
    this.localTasksLoaded,
  });

  @override
  HomeBlocState copyWith({
    tasksLoaded,
    localTasksLoaded,
  }) =>
      HomeBlocLoadingState(
        tasksLoaded: tasksLoaded != '' ? tasksLoaded ?? this.tasksLoaded : null,
        localTasksLoaded: localTasksLoaded != ''
            ? localTasksLoaded ?? this.localTasksLoaded
            : null,
      );
}

final class HomeBlocLoadedState extends HomeBlocState {
  @override
  final List<TaskEntity>? tasksLoaded;
  @override
  final List<LocalTaskEntity>? localTasksLoaded;

  HomeBlocLoadedState({
    this.tasksLoaded,
    this.localTasksLoaded,
  });

  @override
  HomeBlocState copyWith({
    tasksLoaded,
    localTasksLoaded,
  }) =>
      HomeBlocLoadedState(
        tasksLoaded: tasksLoaded != '' ? tasksLoaded ?? this.tasksLoaded : null,
        localTasksLoaded: localTasksLoaded != ''
            ? localTasksLoaded ?? this.localTasksLoaded
            : null,
      );
}

final class HomeBlocErrorState extends HomeBlocState {
  @override
  final List<TaskEntity>? tasksLoaded;
  @override
  final List<LocalTaskEntity>? localTasksLoaded;

  final String? errorMessage;

  HomeBlocErrorState({
    this.tasksLoaded,
    this.localTasksLoaded,
    this.errorMessage,
  });

  @override
  HomeBlocState copyWith({
    tasksLoaded,
    localTasksLoaded,
    errorMessage,
  }) =>
      HomeBlocErrorState(
        tasksLoaded: tasksLoaded != '' ? tasksLoaded ?? this.tasksLoaded : null,
        localTasksLoaded: localTasksLoaded != ''
            ? localTasksLoaded ?? this.localTasksLoaded
            : null,
        errorMessage:
            errorMessage != '' ? errorMessage ?? this.errorMessage : null,
      );
}
