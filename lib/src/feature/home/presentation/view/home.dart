import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xteam_test/src/feature/home/domain/bloc/home_bloc.dart';
import 'package:xteam_test/src/feature/home/presentation/widgets/task.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();

    homeBloc = context.read<HomeBloc>();
    homeBloc.add(FetchTasksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Задачи'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: BlocBuilder<HomeBloc, HomeBlocState>(
          builder: (context, state) => switch (state) {
            HomeBlocLoadedState() => ListView.builder(
                itemCount: state.tasksLoaded.length,
                itemBuilder: (context, index) => TaskWidget(
                  title: state.tasksLoaded[index].title ?? '',
                  completed: state.tasksLoaded[index].completed ?? false,
                ),
              ),
            HomeBlocErrorState(errorMessage: 'Что-то пошло не так') => Center(
                child: Text(state.errorMessage),
              ),
            (_) => const Center(
                child: CircularProgressIndicator(),
              ),
          },
        ),
      ),
    );
  }
}
