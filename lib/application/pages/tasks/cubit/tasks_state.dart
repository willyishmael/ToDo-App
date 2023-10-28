part of 'tasks_cubit.dart';

sealed class TasksState extends Equatable {
  const TasksState();

  @override
  List<Object> get props => [];
}

final class TasksInitialState extends TasksState {}

final class TasksLoadingState extends TasksState {}

final class TasksLoadedState extends TasksState {
  final List<TodoEntity> tasks;
  const TasksLoadedState({required this.tasks});

  @override
  List<Object> get props => [tasks];
}

final class TasksErrorState extends TasksState {
  final Failure failure;
  const TasksErrorState({required this.failure});

  @override
  List<Object> get props => [failure];
}

