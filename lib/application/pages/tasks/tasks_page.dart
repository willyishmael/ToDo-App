import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/application/pages/tasks/cubit/tasks_cubit.dart';
import 'package:todo_app/data/repositories/todo_repository_mock.dart';
import 'package:todo_app/domain/use_cases/todo_use_case.dart';

class TasksPageProvider extends StatelessWidget {
  const TasksPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final todoRepository = TodoRepositoryMock();
        final todoUseCase = TodoUseCase(todoRepository: todoRepository);
        return TasksCubit(todoUseCase: todoUseCase)..readTodoCollections();
      },
      child: const TasksPage(),
    );
  }
}

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TasksCubit, TasksState>(
        builder: (context, state) {
          if (state is TasksLoadingState) {
            return const CircularProgressIndicator.adaptive();
          } else if (state is TasksLoadedState) {
            final tasks = state.tasks;
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final item = tasks[index];
                final colorScheme = Theme.of(context).colorScheme;
                return ListTile(
                  tileColor: colorScheme.surface,
                  selectedTileColor: colorScheme.surfaceVariant,
                  iconColor: item.color.color,
                  selectedColor: item.color.color,
                  onTap: () => debugPrint(item.title),
                  leading: const Icon(Icons.circle),
                  title: Text(item.title),
                );
              },
            );
          } else if (state is TasksErrorState) {
            return const Card(
              child: Text('ERROR, please try again'),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
