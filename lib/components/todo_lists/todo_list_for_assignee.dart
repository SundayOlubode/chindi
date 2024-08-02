import 'package:chindi/models/task.dart';
import 'package:chindi/models/todo_item.dart';
import 'package:chindi/services/firebase_firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TodoListForAssignee extends StatelessWidget {
  final Task task;
  const TodoListForAssignee({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestoreService database = FirebaseFirestoreService();
    return StreamBuilder(
        stream: database.createTaskStream(task.uid!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return const Text('An error occurred');
          }

          var todoList = snapshot.data!.todoList;

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
              for (var index = 0; index < todoList.length; index++) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: todoList[index].done,
                      onChanged: (value) {
                        database.changeTodoItemsDoneStatus(
                          task.uid!,
                          index,
                          value ?? false,
                        );
                      },
                    ),
                    Text(
                      todoList[index].task,
                    ),
                  ],
                )
              ],
            ],
          );
        });
  }
}
