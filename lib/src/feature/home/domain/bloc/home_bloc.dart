import 'dart:async';
import 'dart:convert';
import 'dart:developer';

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
        });
  }

  AppRouter router = AppRouter.instance();

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

      final List<TaskEntity> allTasks =
          newTasks != null ? tasksLoaded + localTasksLoaded! : tasksLoaded;

      emit(HomeBlocLoadedState(
        tasksLoaded: allTasks.reversed.toList(),
      ));
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
        id: 0,
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

    final List<TaskEntity> allTasks =
        state.tasksLoaded!.reversed.toList() + lastLocalTask;

    log('Task saved. Title: ${event.title}, Completed: ${event.completed}');
    emit(HomeBlocLoadedState(tasksLoaded: allTasks.reversed.toList()));
  }
}
