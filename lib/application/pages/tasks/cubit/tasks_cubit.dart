import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/domain/entities/task_entity.dart';
import 'package:todo_app/domain/failures/failures.dart';
import 'package:todo_app/domain/use_cases/task_use_case.dart';
import 'package:todo_app/domain/use_cases/use_case.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit({required this.todoUseCase}) : super(TasksInitialState());

  final TaskUseCase todoUseCase;

  void readTodoCollections() async {
    emit(TasksLoadingState());

    try {
      final result = await todoUseCase.call(NoParams());

      if (result.isLeft) {
        emit(TasksErrorState(failure: result.left));
      } else {
        emit(TasksLoadedState(tasks: result.right));
      }
    } catch (e) {
      emit(TasksErrorState(failure: CubitFailure(stackTrace: e.toString())));
    }
  }
}
