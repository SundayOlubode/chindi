import 'package:flutter/material.dart';
import 'package:chindi_ke/models/task.dart';
import 'package:chindi_ke/components/task_summary.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  const TasksList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          Task task = tasks[index];
          return Column(children: [
            TaskSummary(task: task),
            const SizedBox(
              height: 20,
            )
          ]);
        },
      ),
    );
  }
}
