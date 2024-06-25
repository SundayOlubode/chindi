import 'package:flutter/material.dart';
import 'package:chindi_ke/models/task.dart' as m;

class Task extends StatelessWidget {
  final m.Task task;
  const Task({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
      ),
      body: Center(child: Text(task.title)),
    );
  }
}
