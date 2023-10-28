import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/application/pages/tasks/widgets/tasks_at_loaded_state.dart';
import 'package:todo_app/domain/entities/todo_color.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/domain/entities/unique_id.dart';

void main() {
  Widget widgetUnderTest({required List<TodoEntity> tasks}) {
    return MaterialApp(
      home: Scaffold(
        body: TasksAtLoadedState(tasks: tasks),
      ),
    );
  }

  group('TasksAtLoadedState test:', () {
    late List<TodoEntity> tasks;
    setUp(() {
      tasks = [
        TodoEntity(
          id: CollectionId.fromUniqueString(1.toString()),
          title: 'tasks test',
          color: TodoColor(
            colorIndex: 1,
          ),
        ),
      ];
    });

    testWidgets('Should rendered correctly', (widgetTester) async {
      await widgetTester.pumpWidget(widgetUnderTest(tasks: tasks));
      await widgetTester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(tasks.length));
      expect(find.text(tasks[0].title), findsOneWidget);
    });
  });
}
