import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    prefs.setStringList(event.title, <String>[
      event.title,
      event.completed.toString(),
    ]);
    log('Task stored. Title: ${event.title}, Completed: ${event.completed}');
  }
}
