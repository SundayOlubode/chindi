import 'package:flutter/material.dart';
import 'package:chindi/models/task.dart';
import 'package:chindi/models/user.dart';
import 'package:chindi/components/todo_lists/todo_list_for_task_owner.dart';
import 'package:chindi/components/todo_lists/todo_list_for_assignee.dart';
import 'package:chindi/components/todo_lists/general_todo_list.dart';

class TodoListWrapper extends StatelessWidget {
  final Task task;
  final User currentUser;
  const TodoListWrapper(
      {super.key, required this.task, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    if (task.assignedTo != null && currentUser.uid == task.assignedTo!.uid) {
      return TodoListForAssignee(task: task);
    } else if (currentUser.uid == task.owner.uid) {
      return TodoListForTaskOwner(task: task);
    } else {
      return GeneralTodoList(todoList: task.todoList);
    }
  }
}
