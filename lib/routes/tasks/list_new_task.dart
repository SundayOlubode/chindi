import 'package:chindi_ke/components/utils/custom_form.dart';
import 'package:chindi_ke/models/todo_item.dart';
import 'package:flutter/material.dart';

class ListNewTask extends StatefulWidget {
  const ListNewTask({super.key});

  @override
  State<ListNewTask> createState() => _ListNewTaskState();
}

class _ListNewTaskState extends State<ListNewTask> {
  List<TodoItem> todos = [];
  final _formKey = GlobalKey<FormState>();

  // Focus Node
  final _focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: CustomForm(
          key: _formKey,
          children: [
            TextFormField(
              autofocus: true,
              focusNode: _focus,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Title';
                }
                return null;
              },
              maxLength: 30,
            ),
            const SizedBox(height: 30),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Location',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Location';
                }
                return null;
              },
              maxLength: 50,
            ),
            const SizedBox(height: 30),
            TextFormField(
              maxLines: 5,
              minLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Task Description';
                }
                return null;
              },
              maxLength: 250,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Todo List'),
                TextButton(
                  onPressed: () {
                    setState(() {
                      todos.add(TodoItem());
                    });
                  },
                  child: const Text('Add todo'),
                ),
              ],
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: double.minPositive,
              ),
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return TextField(onChanged: (String value) {
                    setState(() {
                      todos[index].task = value;
                    });
                  });
                },
              ),
            ),

            // TextFormField(
            //   decoration: const InputDecoration(
            //     border: OutlineInputBorder(),
            //     labelText: 'To-do List',
            //   ),
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'Please enter To-do List';
            //     }
            //     return null;
            //   },
            //   maxLength: 500,
            // ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 50),
                  ),
                  child: const Text('Create Job'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
