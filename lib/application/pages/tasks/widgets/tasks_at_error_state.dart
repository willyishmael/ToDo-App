import 'package:flutter/material.dart';

class TasksAtErrorState extends StatelessWidget {
  const TasksAtErrorState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Text('Error, please try again!'),
    );
  }
}