import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/domain/entities/unique_id.dart';
import 'package:todo_app/domain/failures/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class Params extends Equatable {}

class NoParams extends Params {
  @override
  List<Object?> get props => [];
}

class TaskEntryIdsParams extends Params {
  TaskEntryIdsParams({
    required this.taskId,
    required this.entryId,
  }) : super();

  final EntryId entryId;
  final TaskId taskId;

  @override
  List<Object> get props => [taskId, entryId];
}