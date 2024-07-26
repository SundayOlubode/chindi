import 'package:chindi/components/todo_list_input.dart';
import 'package:chindi/components/utils/custom_form.dart';
import 'package:chindi/components/utils/custom_text_form_field.dart';
import 'package:chindi/models/todo_item.dart';
import 'package:chindi/utils/validators/validate_name.dart';
import 'package:flutter/material.dart';

class ListNewTask extends StatefulWidget {
  const ListNewTask({super.key});

  @override
  State<ListNewTask> createState() => _ListNewTaskState();
}

class _ListNewTaskState extends State<ListNewTask> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _streetAddressController = TextEditingController();
  final _suburbController = TextEditingController();
  final _cityController = TextEditingController();
  final _countyController = TextEditingController();

  List<TodoItem> _todos = [];

  void addTodo() {
    setState(() {
      _todos.add(TodoItem());
    });
  }

  void deleteTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List new task'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: CustomForm(
          formKey: _formKey,
          children: [
            CustomTextFormField(
              label: 'Title',
              controller: _titleController,
              validator: validateName,
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              label: 'Description',
              numberOfLines: 5,
              controller: _descriptionController,
              validator: validateName,
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              label: 'Street Address',
              controller: _streetAddressController,
              validator: validateName,
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              label: 'Suburb',
              controller: _suburbController,
              validator: validateName,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    label: 'City',
                    controller: _cityController,
                    validator: validateName,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomTextFormField(
                    label: 'County',
                    controller: _countyController,
                    validator: validateName,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            TodoListInput(
              todos: _todos,
              addTodo: addTodo,
              deleteTodo: deleteTodo,
            ),
            const SizedBox(
              height: 10,
            ),
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
      ),
    );
  }
}
