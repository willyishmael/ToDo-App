import 'package:todo_app/domain/entities/todo_color.dart';
import 'package:todo_app/domain/entities/unique_id.dart';

class TaskEntity {
  final TaskId id;
  final String title;
  final TodoColor color;

  TaskEntity({
    required this.id,
    required this.title,
    required this.color,
  });

  factory TaskEntity.empty() {
    return TaskEntity(
      id: TaskId(),
      title: '',
      color: TodoColor(colorIndex: 0),
    );
  }
}
