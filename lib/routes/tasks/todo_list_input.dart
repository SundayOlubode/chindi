import 'package:chindi/models/todo_item.dart';
import 'package:flutter/material.dart';

class TodoListInput extends StatefulWidget {
  final List<TodoItem> initialTodos;
  final Function(List<TodoItem>) onSaved;
  const TodoListInput({
    super.key,
    required this.initialTodos,
    required this.onSaved,
  });

  @override
  State<TodoListInput> createState() => _TodoListInputState();
}

class _TodoListInputState extends State<TodoListInput> {
  List<TodoItem> _todos = [];

  @override
  void initState() {
    super.initState();
    _todos = widget.initialTodos;
  }

  void addTodo() {
    setState(() {
      _todos.add(TodoItem());
    });
  }

  void deleteTodo(TodoItem todo) {
    setState(() {
      _todos.remove(todo);
    });
  }

  void handleSave() {
    widget.onSaved(_todos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit task to-do list'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: _todos.map((todo) {
                return ListTile(
                  title: TextFormField(
                    initialValue: todo.task,
                    onChanged: (value) {
                      todo.task = value;
                    },
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      deleteTodo(todo);
                    },
                  ),
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: addTodo,
                  child: const Text(
                    'Add to-do',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _todos);
              },
              child: const Text('Save to-do list'),
            ),
          ],
        ),
      ),
    );
  }
}
