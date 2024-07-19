import 'package:flutter/material.dart';
import 'package:chindi/models/todo_item.dart';

class TodoList extends StatelessWidget {
  final List<TodoItem> todoList;
  const TodoList({super.key, required this.todoList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
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
          Expanded(
            child: Column(
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
          ),
        ],
      ),
    );
  }
}
