import 'package:flutter/material.dart';
import 'package:chindi_ke/models/task.dart';

class TaskDisplay extends StatelessWidget {
  final Task task;
  const TaskDisplay({super.key, required this.task});

  String formatCurrency(double amount) {
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(task.title),
        Text(formatCurrency(task.pay)),
      ],
    );
  }
}
