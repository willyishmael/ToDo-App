import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/application/pages/tasks/widgets/tasks_at_loading_state.dart';

void main() {
  Widget widgetUnderTest() {
    return const MaterialApp(
      home: Scaffold(
        body: TasksAtLoadingState(),
      ),
    );
  }

  group('TasksAtLoadingState test:', () { 
    testWidgets('Should rendered correctly', (widgetTester) async {
      await widgetTester.pumpWidget(widgetUnderTest());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}