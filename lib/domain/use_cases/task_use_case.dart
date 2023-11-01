
import 'package:either_dart/either.dart';
import 'package:todo_app/domain/entities/task_entity.dart';
import 'package:todo_app/domain/failures/failures.dart';
import 'package:todo_app/domain/repository_protocols/todo_repository_protocol.dart';
import 'package:todo_app/domain/use_cases/use_case.dart';

class TaskUseCase implements UseCase<List<TaskEntity>, NoParams> {
  const TaskUseCase({required this.todoRepository});

  final TodoRepositoryProtocol todoRepository;

  @override
  Future<Either<Failure, List<TaskEntity>>> call(NoParams params) async {
    try {
      final loadedCollections = todoRepository.getTaskList();

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