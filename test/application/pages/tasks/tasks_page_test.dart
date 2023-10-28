import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/application/pages/tasks/cubit/tasks_cubit.dart';
import 'package:todo_app/application/pages/tasks/tasks_page.dart';
import 'package:todo_app/application/pages/tasks/widgets/tasks_at_loaded_state.dart';
import 'package:todo_app/application/pages/tasks/widgets/tasks_at_loading_state.dart';
import 'package:todo_app/domain/entities/todo_color.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/domain/entities/unique_id.dart';

class MockTasksCubit extends MockCubit<TasksState> implements TasksCubit {}

void main() {
  Widget widgetUnderTest({required TasksCubit cubit}) {
    return MaterialApp(
      home: BlocProvider<TasksCubit>(
        create: (context) => cubit..readTodoCollections(),
        child: const Scaffold(body: TasksPage()),
      ),
    );
  }

  group('TasksPage tests:', () {
    late MockTasksCubit mockTasksCubit;

    setUp(() => mockTasksCubit = MockTasksCubit());

    group('Should displayed view state', () {
      testWidgets(
        'Loading when cubit emits TasksLoadingState',
        (widgetTester) async {
          whenListen(
            mockTasksCubit,
            Stream.fromIterable([TasksLoadingState()]),
            initialState: TasksLoadingState(),
          );

          await widgetTester.pumpWidget(widgetUnderTest(cubit: mockTasksCubit));

          expect(find.byType(TasksAtLoadingState), findsOneWidget);
        },
      );

      testWidgets(
        'Loaded when cubit emits TasksLoadedState',
        (widgetTester) async {
          final tasks = [
            TodoEntity(
              id: CollectionId.fromUniqueString(1.toString()),
              title: 'tasks test',
              color: TodoColor(
                colorIndex: 1,
              ),
            ),
          ];

          whenListen(
            mockTasksCubit,
            Stream.fromIterable([TasksLoadedState(tasks: tasks)]),
            initialState: TasksLoadingState(),
          );

          await widgetTester.pumpWidget(widgetUnderTest(cubit: mockTasksCubit));
          await widgetTester.pumpAndSettle();

          expect(find.byType(TasksAtLoadingState), findsNothing);
          expect(find.byType(TasksAtLoadedState), findsOneWidget);
          expect(find.text('tasks test'), findsOneWidget);
        },
      );
    });
  });
}
