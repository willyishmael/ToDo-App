import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/application/pages/tasks/cubit/tasks_cubit.dart';
import 'package:todo_app/domain/entities/todo_color.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/domain/entities/unique_id.dart';
import 'package:todo_app/domain/failures/failures.dart';
import 'package:todo_app/domain/use_cases/todo_use_case.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:todo_app/domain/use_cases/use_case.dart';

class MockTodoUseCase extends Mock implements TodoUseCase {}

void main() {
  group('TasksCubit Test:', () {
    final mockTodoUseCase = MockTodoUseCase();
    final expectedValue = Right<Failure, List<TodoEntity>>([
      TodoEntity(
        id: CollectionId.fromUniqueString(1.toString()),
        title: 'bloc test',
        color: TodoColor(
          colorIndex: 1,
        ),
      ),
    ]);
    final expectedFailure = Left<Failure, List<TodoEntity>>(ServerFailure());

    blocTest<TasksCubit, TasksState>(
      'emits [TasksLoadingState, TasksLoadedState] when TodoUseCase is called.',
      setUp: () {
        when(() => mockTodoUseCase(NoParams()))
            .thenAnswer((invocation) => Future.value(expectedValue));
      },
      build: () => TasksCubit(todoUseCase: mockTodoUseCase),
      act: (TasksCubit bloc) => bloc.readTodoCollections(),
      expect: () => <TasksState>[
        TasksLoadingState(),
        TasksLoadedState(tasks: expectedValue.value)
      ],
    );

    blocTest<TasksCubit, TasksState>(
      'emits [TasksLoadingState, TasksErrorState] when TodoUseCase is called and error occurred.',
      setUp: () {
        when(() => mockTodoUseCase(NoParams()))
            .thenAnswer((invocation) => Future.value(expectedFailure));
      },
      build: () => TasksCubit(todoUseCase: mockTodoUseCase),
      act: (TasksCubit bloc) => bloc.readTodoCollections(),
      expect: () => <TasksState>[TasksLoadingState(), TasksErrorState(failure: expectedFailure.value)],
    );
  });
}
