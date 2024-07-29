import 'package:chindi/models/task.dart';
import 'package:chindi/models/todo_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TodoListForTaskOwner extends StatelessWidget {
  final Task task;
  const TodoListForTaskOwner({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('tasks')
            .doc(task.uid!)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return const Text('An error occurred');
          }

          var taskMap = Map<String, dynamic>.from(snapshot.data!.data()!);
          var todoList = taskMap['toDoList']
              .map((todoItemMap) => TodoItem.fromMap(todoItemMap))
              .toList();

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
                ...todoList.map(
                  (todoItem) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: todoItem.done,
                          onChanged: null,
                        ),
                        Text(
                          todoItem.task,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        });
  }
}
