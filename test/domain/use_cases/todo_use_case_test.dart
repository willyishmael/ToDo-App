import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/domain/entities/todo_color.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/domain/entities/unique_id.dart';
import 'package:todo_app/domain/failures/failures.dart';
import 'package:todo_app/domain/repository_protocols/todo_repository_protocol.dart';
import 'package:todo_app/domain/use_cases/todo_use_case.dart';
import 'package:todo_app/domain/use_cases/use_case.dart';

@GenerateNiceMocks([MockSpec<TodoRepositoryProtocol>()])
import 'todo_use_case_test.mocks.dart';

void main() {
  group('TodoUseCase test:', () {
    group('Should return TodoEntity', () {
      test('when TodoRepository returns TodoModel', () async {
        final todoRepositoryMock = MockTodoRepositoryProtocol();
        final todoUseCaseUnderTest =
            TodoUseCase(toDoRepository: todoRepositoryMock);

        final dummyData = Right<Failure, List<TodoEntity>>([
          TodoEntity(
            id: CollectionId(),
            title: 'test',
            color: TodoColor(colorIndex: 1),
          ),
        ]);

        provideDummy(dummyData);

        when(todoRepositoryMock.readTodoCollections()).thenAnswer(
          (realInvocation) => Future.value(dummyData),
        );

        final result = await todoUseCaseUnderTest.call(NoParams());
        expect(result.isLeft, false);
        expect(result.isRight, true);
        expect(result, dummyData);
        verify(() => todoRepositoryMock.readTodoCollections()).called(1);
        verifyNoMoreInteractions(todoRepositoryMock);
      });
    });
    group('Should return Failure', () {
      test('when TodoRepository returns Failure', () async {
        final todoRepositoryMock = MockTodoRepositoryProtocol();
        final todoUseCaseUnderTest =
            TodoUseCase(toDoRepository: todoRepositoryMock);

        final dummyData = Left<Failure, List<TodoEntity>>(ServerFailure());
        provideDummy(dummyData);

        when(todoRepositoryMock.readTodoCollections())
            .thenAnswer((realInvocation) => Future.value(dummyData));

        final result = await todoUseCaseUnderTest.call(NoParams());

        expect(result.isLeft, true);
        expect(result.isRight, false);
        expect(result, dummyData);
        verify(() => todoRepositoryMock.readTodoCollections()).called(1);
        verifyNoMoreInteractions(todoRepositoryMock);
      });
    });
  });
}
