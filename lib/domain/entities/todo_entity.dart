import 'package:todo_app/domain/entities/todo_color.dart';
import 'package:todo_app/domain/entities/unique_id.dart';

class TodoEntity {
  final CollectionId id;
  final String title;
  final TodoColor color;

  TodoEntity({
    required this.id,
    required this.title,
    required this.color,
  });

  factory TodoEntity.empty() {
    return TodoEntity(
      id: CollectionId(),
      title: '',
      color: TodoColor(colorIndex: 0),
    );
  }
}
