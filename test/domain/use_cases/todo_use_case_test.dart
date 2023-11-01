import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/domain/entities/todo_color.dart';
import 'package:todo_app/domain/entities/task_entity.dart';
import 'package:todo_app/domain/entities/unique_id.dart';
import 'package:todo_app/domain/failures/failures.dart';
import 'package:todo_app/domain/repository_protocols/todo_repository_protocol.dart';
import 'package:todo_app/domain/use_cases/task_use_case.dart';
import 'package:todo_app/domain/use_cases/use_case.dart';

class MockTodoRepository extends Mock implements TodoRepositoryProtocol {}

void main() {
  final todoRepository = MockTodoRepository();

  group('TodoUseCase test:', () {
    final todoUseCaseUnderTest = TaskUseCase(todoRepository: todoRepository);

    group('Should return TodoEntity', () {
      test('when TodoRepository returns TodoModel', () async {
        final dummyData = Right<Failure, List<TaskEntity>>(List.generate(
          5,
          (index) => TaskEntity(
            id: TaskId.fromUniqueString('id $index'),
            title: 'title $index',
            color: TodoColor(
              colorIndex: index % TodoColor.predefinedColors.length,
            ),
          ),
        ));

        when(() => todoRepository.getTaskList())
            .thenAnswer((_) => Future.value(dummyData));

        final result = await todoUseCaseUnderTest(NoParams());
        expect(result.isLeft, false);
        expect(result.isRight, true);
        expect(result, dummyData);
        verify(() => todoRepository.getTaskList()).called(1);
        verifyNoMoreInteractions(todoRepository);
      });
    });
    group('Should return Failure', () {
      late Left<Failure, List<TaskEntity>> expectedError;

      setUpAll(() =>
          expectedError = Left<Failure, List<TaskEntity>>(ServerFailure()));
      test('when TodoRepository returns Failure', () async {
        when(() => todoRepository.getTaskList())
            .thenAnswer((realInvocation) => Future.value(expectedError));

        final result = await todoUseCaseUnderTest.call(NoParams());

        expect(result.isLeft, true);
        expect(result.isRight, false);
        expect(result, expectedError);
        verify(() => todoRepository.getTaskList()).called(1);
        verifyNoMoreInteractions(todoRepository);
      });

      test('when error occurred', () async {
        when(() => todoRepository.getTaskList()).thenThrow(Exception());

        final result = await todoUseCaseUnderTest.call(NoParams());

        expect(result.isLeft, true);
        expect(result.isRight, false);
        verify(() => todoRepository.getTaskList()).called(1);
        verifyNoMoreInteractions(todoRepository);
      });
    });
  });
}
