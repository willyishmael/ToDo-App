import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/domain/entities/todo_color.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/domain/entities/unique_id.dart';
import 'package:todo_app/domain/failures/failures.dart';
import 'package:todo_app/domain/repository_protocols/todo_repository_protocol.dart';
import 'package:todo_app/domain/use_cases/todo_use_case.dart';
import 'package:todo_app/domain/use_cases/use_case.dart';

class MockTodoRepository extends Mock implements TodoRepositoryProtocol {}

void main() {
  final todoRepository = MockTodoRepository();

  group('TodoUseCase test:', () {
    final todoUseCaseUnderTest =
            TodoUseCase(toDoRepository: todoRepository);

    group('Should return TodoEntity', () {
      test('when TodoRepository returns TodoModel', () async {
        final dummyData = Right<Failure, List<TodoEntity>>(List.generate(
          5,
          (index) => TodoEntity(
            id: CollectionId.fromUniqueString('id $index'),
            title: 'title $index',
            color: TodoColor(
              colorIndex: index % TodoColor.predefinedColors.length,
            ),
          ),
        ));

        when(() => todoRepository.readTodoCollections()).thenAnswer(
            (_) => Future.value(dummyData));

        final result = await todoUseCaseUnderTest(NoParams());
        expect(result.isLeft, false);
        expect(result.isRight, true);
        expect(result, dummyData);
        verify(() => todoRepository.readTodoCollections()).called(1);
        verifyNoMoreInteractions(todoRepository);
      });
    });
    group('Should return Failure', () {
      test('when TodoRepository returns Failure', () async {
        final dummyData = Left<Failure, List<TodoEntity>>(ServerFailure());

        when(() => todoRepository.readTodoCollections())
            .thenAnswer((realInvocation) => Future.value(dummyData));

        final result = await todoUseCaseUnderTest.call(NoParams());

        expect(result.isLeft, true);
        expect(result.isRight, false);
        expect(result, dummyData);
        verify(() => todoRepository.readTodoCollections()).called(1);
        verifyNoMoreInteractions(todoRepository);
      });
    });
  });
}
