import 'package:flutter/material.dart';
import 'package:chindi_ke/models/todo_item.dart';

class TodoList extends StatefulWidget {
  final void Function()? onTodoListComplete;

  const TodoList({super.key, this.onTodoListComplete});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  int numberOfItemsDone = 0;

  final List<TodoItem> todos = [
    TodoItem(task: 'Wash the dishes.'),
    TodoItem(task: 'Store away the dishes.'),
    TodoItem(task: 'Clean the counters'),
    TodoItem(task: 'Clean the stovetop.'),
    TodoItem(task: 'Clean the oven.'),
    TodoItem(task: 'Sweep the kitchen floor.'),
    TodoItem(task: 'Mop the floor.'),
    TodoItem(task: 'Take out the trash bag from the bin.'),
    TodoItem(task: 'Replace the trash bag in the bin.'),
    TodoItem(task: 'Wash the dishtowels.')
  ];

  @override
  void initState() {
    super.initState();
    for (TodoItem todo in todos) {
      if (todo.done) {
        numberOfItemsDone += 1;
      }
    }
  }

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
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text('Done $numberOfItemsDone / ${todos.length} tasks.'),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, int index) {
                TodoItem todo = todos[index];
                return ListTile(
                  onTap: () {
                    setState(() {
                      if (todo.done) {
                        // The item is being unmarked as done
                        numberOfItemsDone -= 1;
                      } else {
                        // The item is being marked as done
                        numberOfItemsDone += 1;
                      }

                      // When you have done everything we call the onTodoListComplete function
                      if (numberOfItemsDone == todos.length) {
                        widget.onTodoListComplete!();
                      }
                    });
                  },
                  leading: Icon(
                    todo.done
                        ? Icons.check_box_outlined
                        : Icons.check_box_outline_blank_outlined,
                  ),
                  title: Text(
                    todo.task,
                    style: TextStyle(
                      decoration: todo.done
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: todo.done
                          ? Colors.grey.shade700
                          : Colors.grey.shade900,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
