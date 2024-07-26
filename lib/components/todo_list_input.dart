import 'package:flutter/material.dart';

class TodoListInput extends StatelessWidget {
  final List todos;
  final void Function() addTodo;
  final void Function(int index) deleteTodo;
  const TodoListInput({
    super.key,
    required this.todos,
    required this.addTodo,
    required this.deleteTodo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey.shade50,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Todo List',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: addTodo,
                  child: const Text(
                    'Add todo item',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: todos.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       return const ListTile(
            //         title: TextField(),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
