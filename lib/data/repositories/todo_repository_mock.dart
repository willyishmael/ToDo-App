import 'package:either_dart/either.dart';
import 'package:todo_app/domain/entities/todo_color.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/domain/entities/unique_id.dart';
import 'package:todo_app/domain/failures/failures.dart';
import 'package:todo_app/domain/repository_protocols/todo_repository_protocol.dart';

class TodoRepositoryMock implements TodoRepositoryProtocol {
  @override
  Future<Either<Failure, List<TodoEntity>>> readTodoCollections() {
    final list = List<TodoEntity>.generate(
      10,
      (index) => TodoEntity(
        id: CollectionId.fromUniqueString(index.toString()),
        title: 'title $index',
        color: TodoColor(
          colorIndex: index % TodoColor.predefinedColors.length,
        ),
      ),
    );

    return Future.delayed(
      const Duration(milliseconds: 200),
      () => Right(list),
    );
  }
}
