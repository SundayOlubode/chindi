import 'package:flutter/material.dart';
import 'package:chindi/models/todo_item.dart';

class GeneralTodoList extends StatelessWidget {
  final List<TodoItem> todoList;
  const GeneralTodoList({super.key, required this.todoList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'To-do List',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Column(
          children: todoList.map(
            (TodoItem todoItem) {
              return Row(
                children: [
                  const Text(
                    '\u2022 ',
                  ),
                  Text(
                    todoItem.task,
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
