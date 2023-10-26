import 'package:either_dart/either.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/domain/failures/failures.dart';

abstract class TodoRepositoryProtocol {
  Future<Either<Failure, List<TodoEntity>>> readTodoCollections();
}