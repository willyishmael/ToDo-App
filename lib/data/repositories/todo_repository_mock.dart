import 'package:either_dart/either.dart';
import 'package:todo_app/domain/entities/entry_entity.dart';
import 'package:todo_app/domain/entities/todo_color.dart';
import 'package:todo_app/domain/entities/task_entity.dart';
import 'package:todo_app/domain/entities/unique_id.dart';
import 'package:todo_app/domain/failures/failures.dart';
import 'package:todo_app/domain/repository_protocols/todo_repository_protocol.dart';

class TodoRepositoryMock implements TodoRepositoryProtocol {
  @override
  Future<Either<Failure, List<TaskEntity>>> getTaskList() {
    final list = List<TaskEntity>.generate(
      10,
      (index) => TaskEntity(
        id: TaskId.fromUniqueString(index.toString()),
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

  @override
  Future<Either<Failure, EntryEntity>> readToDoEntry(
      TaskId taskId, EntryId entryId) {
    // TODO: implement readToDoEntry
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<EntryId>>> readToDoEntryIds(TaskId taskId) {
    // TODO: implement readToDoEntryIds
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, EntryEntity>> updateToDoEntry({
    required TaskId collectionId,
    required EntryId entryId,
  }) {
    // TODO: implement updateToDoEntry
    throw UnimplementedError();
  }
}
