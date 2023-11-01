import 'package:either_dart/either.dart';
import 'package:todo_app/domain/entities/entry_entity.dart';
import 'package:todo_app/domain/failures/failures.dart';
import 'package:todo_app/domain/repository_protocols/todo_repository_protocol.dart';
import 'package:todo_app/domain/use_cases/use_case.dart';

class UpdateToDoEntry implements UseCase<EntryEntity, TaskEntryIdsParams> {
  const UpdateToDoEntry({required this.toDoRepository});

  final TodoRepositoryProtocol toDoRepository;

  @override
  Future<Either<Failure, EntryEntity>> call(TaskEntryIdsParams params) async {
    try {
      final loadedEntry = await toDoRepository.updateToDoEntry(
        collectionId: params.taskId,
        entryId: params.entryId,
      );
      return loadedEntry.fold(
        (left) => Left(left),
        (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
