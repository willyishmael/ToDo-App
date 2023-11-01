import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/application/pages/tasks/cubit/tasks_cubit.dart';
import 'package:todo_app/application/pages/tasks/widgets/tasks_at_error_state.dart';
import 'package:todo_app/application/pages/tasks/widgets/tasks_at_loaded_state.dart';
import 'package:todo_app/application/pages/tasks/widgets/tasks_at_loading_state.dart';
import 'package:todo_app/data/repositories/todo_repository_mock.dart';
import 'package:todo_app/domain/use_cases/task_use_case.dart';

class TasksPageProvider extends StatelessWidget {
  const TasksPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final todoRepository = TodoRepositoryMock();
        final todoUseCase = TaskUseCase(todoRepository: todoRepository);
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
            return const TasksAtLoadingState();
          } else if (state is TasksLoadedState) {
            final tasks = state.tasks;
            return TasksAtLoadedState(tasks: tasks);
          } else if (state is TasksErrorState) {
            return const TasksAtErrorState();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}