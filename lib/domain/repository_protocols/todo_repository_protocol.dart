import 'package:either_dart/either.dart';
import 'package:todo_app/domain/entities/entry_entity.dart';
import 'package:todo_app/domain/entities/task_entity.dart';
import 'package:todo_app/domain/entities/unique_id.dart';
import 'package:todo_app/domain/failures/failures.dart';

abstract class TodoRepositoryProtocol {
  Future<Either<Failure, List<TaskEntity>>> getTaskList();

  Future<Either<Failure, EntryEntity>> readToDoEntry(
      TaskId taskId, EntryId entryId);

  Future<Either<Failure, List<EntryId>>> readToDoEntryIds(TaskId taskId);

  Future<Either<Failure, EntryEntity>> updateToDoEntry({
    required TaskId collectionId,
    required EntryId entryId,
  });
}