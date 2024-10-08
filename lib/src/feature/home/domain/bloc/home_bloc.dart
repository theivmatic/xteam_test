import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xteam_test/src/core/routes/app_router.dart';
import 'package:xteam_test/src/feature/home/data/interfaces/home_api_impl.dart';
import 'package:xteam_test/src/feature/home/domain/entity/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBloc() : super(HomeBlocInitialState()) {
    on<HomeBlocEvent>((event, emit) => switch (event) {
          FetchTasksEvent() => _fetchTasks(event, emit),
          AddTaskEvent() => _addTask(event, emit),
          CheckTaskEvent() => _checkTask(event, emit),
          DeleteTaskEvent() => _deleteTask(event, emit),
        });
  }

  AppRouter router = AppRouter.instance();

  final uuid = Random();

  FutureOr<void> _fetchTasks(
    FetchTasksEvent event,
    Emitter<HomeBlocState> emit,
  ) async {
    try {
      final List<TaskEntity> tasksLoaded = await HomeApiImpl().getTasks();
      final prefs = await SharedPreferences.getInstance();
      final newTasks = prefs.getStringList('tasks');

      final localTasksLoaded = newTasks
          ?.map((jsonString) => TaskEntity.fromJson(jsonDecode(jsonString)))
          .toList();

      final List<TaskEntity> allTasks = newTasks != null
          ? localTasksLoaded!.reversed.toList() + tasksLoaded
          : tasksLoaded;

      emit(HomeBlocLoadedState(tasksLoaded: allTasks));
    } catch (e) {
      emit(HomeBlocErrorState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _addTask(
    AddTaskEvent event,
    Emitter<HomeBlocState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final tasks = prefs.getStringList('tasks');
    final jsonString = jsonEncode(
      TaskEntity(
        userId: 0,
        id: uuid.nextInt(100000),
        title: event.title,
        completed: event.completed,
      ).toJson(),
    );

    if (tasks != null) {
      prefs.setStringList(
        'tasks',
        tasks +
            <String>[
              jsonString,
            ],
      );
    } else {
      prefs.setStringList(
        'tasks',
        <String>[
          jsonString,
        ],
      );
    }
    final newTasks = prefs.getStringList('tasks');

    final localTasksLoaded = newTasks
        ?.map((jsonString) => TaskEntity.fromJson(jsonDecode(jsonString)))
        .toList();

    final List<TaskEntity> lastLocalTask = [
      localTasksLoaded!.last,
    ];

    final List<TaskEntity> allTasks = lastLocalTask + state.tasksLoaded!;

    dev.log('Task saved. Title: ${event.title}, Completed: ${event.completed}');
    emit(HomeBlocLoadedState(tasksLoaded: allTasks));
  }

  FutureOr<void> _checkTask(
    CheckTaskEvent event,
    Emitter<HomeBlocState> emit,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final tasks = prefs.getStringList('tasks');

      final taskList = tasks
          ?.map((jsonString) => TaskEntity.fromJson(jsonDecode(jsonString)))
          .toList();

      final task = taskList?.singleWhere((item) => item.userId == event.taskId);

      final jsonString = jsonEncode(
        TaskEntity(
          userId: task?.userId,
          id: task?.id,
          title: task?.title,
          completed: event.completed,
        ).toJson(),
      );

      taskList?.remove(task);
      state.tasksLoaded?.remove(task);

      taskList?.insert(event.index ?? 0, task!);

      prefs.setStringList('tasks', tasks! + <String>[jsonString]);

      final List<TaskEntity> allTasks = taskList! + state.tasksLoaded!;

      emit(HomeBlocLoadedState(tasksLoaded: allTasks));
    } on Exception catch (e) {
      emit(HomeBlocErrorState());
    }
  }

  FutureOr<void> _deleteTask(
    DeleteTaskEvent event,
    Emitter<HomeBlocState> emit,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final tasks = prefs.getStringList('tasks');

      final localTasksLoaded = tasks
          ?.map((jsonString) => TaskEntity.fromJson(jsonDecode(jsonString)))
          .toList();

      localTasksLoaded?.removeWhere((item) => item.id == event.taskId);
      state.tasksLoaded?.removeWhere((item) => item.id == event.taskId);

      final newTasksList =
          localTasksLoaded?.map((item) => jsonEncode(item)).toList();

      prefs.setStringList('tasks', newTasksList!);

      final List<TaskEntity> allTasks = localTasksLoaded! + state.tasksLoaded!;

      emit(HomeBlocLoadedState(tasksLoaded: allTasks));
    } on Exception catch (e) {
      emit(HomeBlocErrorState());
    }
  }
}
