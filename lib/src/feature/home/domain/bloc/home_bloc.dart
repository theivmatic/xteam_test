import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xteam_test/src/core/routes/app_router.dart';
import 'package:xteam_test/src/feature/home/data/interfaces/home_api_impl.dart';
import 'package:xteam_test/src/feature/home/domain/entity/local_task.dart';
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
      emit(HomeBlocLoadedState(tasksLoaded: tasksLoaded));
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
    if (tasks != null) {
      prefs.setStringList(
        'tasks',
        tasks +
            <String>[
              jsonEncode(
                LocalTaskEntity(title: event.title, completed: event.completed)
                    .toJson(),
              ),
            ],
      );
    } else {
      prefs.setStringList(
        'tasks',
        <String>[
          jsonEncode(
            LocalTaskEntity(title: event.title, completed: event.completed)
                .toJson(),
          ),
        ],
      );
    }
    final newTasks = prefs.getStringList('tasks');

    final tasksLoaded = newTasks
        ?.map((jsonString) => LocalTaskEntity.fromJson(jsonDecode(jsonString)))
        .toList();

    log('Task saved. Title: ${event.title}, Completed: ${event.completed}');
    // emit(HomeBlocLoadedState());
  }
}
