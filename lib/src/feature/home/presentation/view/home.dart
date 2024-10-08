import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xteam_test/src/core/localization/localization.dart';
import 'package:xteam_test/src/core/services/dialogs_displayer.dart';
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

  final TextEditingController controller = TextEditingController();

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
        title: const Text(L.tasks),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DialogsDisplayer.showAddToDoDialog(
            context,
            controller,
            () {
              if (controller.text.isEmpty) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(L.enterTaskTitle),
                  ),
                );
              } else {
                homeBloc.add(
                  AddTaskEvent(
                    title: controller.text,
                    completed: false,
                  ),
                );
                Navigator.of(context).pop();
              }
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: BlocBuilder<HomeBloc, HomeBlocState>(
          buildWhen: (previous, current) =>
              previous.tasksLoaded != current.tasksLoaded,
          builder: (context, state) => switch (state) {
            HomeBlocLoadedState() => ListView.builder(
                itemCount: state.tasksLoaded?.length,
                itemBuilder: (context, index) => TaskWidget(
                  title: state.tasksLoaded?[index].title ?? '',
                  completed: state.tasksLoaded?[index].completed ?? false,
                  onChanged: (value) {},
                  onLongPress: () => homeBloc.add(
                    DeleteTaskEvent(
                      taskId: state.tasksLoaded?[index].id,
                    ),
                  ),
                ),
              ),
            HomeBlocErrorState(errorMessage: L.somethingWentWrong) => Center(
                child: Text(state.errorMessage ?? L.somethingWentWrong),
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
