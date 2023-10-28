import 'package:flutter/material.dart';

class TasksAtLoadingState extends StatelessWidget {
  const TasksAtLoadingState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator.adaptive();
  }
}