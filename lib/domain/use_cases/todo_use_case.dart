
import 'package:either_dart/either.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/domain/failures/failures.dart';
import 'package:todo_app/domain/repository_protocols/todo_repository_protocol.dart';
import 'package:todo_app/domain/use_cases/use_case.dart';

class LoadToDoCollections implements UseCase<List<TodoEntity>, NoParams> {
  const LoadToDoCollections({required this.toDoRepository});

  final TodoRepositoryProtocol toDoRepository;

  @override
  Future<Either<Failure, List<TodoEntity>>> call(NoParams params) async {
    try {
      final loadedCollections = toDoRepository.readToDoCollections();

      return loadedCollections.fold(
        (left) => Left(left),
        (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(
        ServerFailure(stackTrace: e.toString()),
      );
    }
  }
}