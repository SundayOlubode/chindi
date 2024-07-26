import 'package:chindi/routes/tasks/list_new_task.dart';
import 'package:flutter/material.dart';

class ListNewTaskFab extends StatelessWidget {
  const ListNewTaskFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      icon: Icon(
        Icons.add_task,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      label: Text(
        'List new task',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ListNewTask(),
          ),
        );
      },
    );
  }
}
