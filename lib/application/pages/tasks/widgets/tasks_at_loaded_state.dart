import 'package:flutter/material.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';

class TasksAtLoadedState extends StatelessWidget {
  const TasksAtLoadedState({
    super.key,
    required this.tasks,
  });

  final List<TodoEntity> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final item = tasks[index];
        return Card(
          color: item.color.color,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: ListTile(
            onTap: () => debugPrint(item.title),
            title: Text(item.title),
          ),
        );
      },
    );
  }
}