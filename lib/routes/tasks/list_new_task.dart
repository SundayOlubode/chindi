import 'package:chindi/components/utils/custom_form.dart';
import 'package:chindi/components/utils/custom_text_form_field.dart';
import 'package:chindi/models/task.dart';
import 'package:chindi/models/user.dart';
import 'package:chindi/providers/user_provider.dart';
import 'package:chindi/services/firebase_firestore_service.dart';
import 'package:chindi/utils/constants/sizes.dart';
import 'package:chindi/utils/validators/validate_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListNewTask extends StatefulWidget {
  const ListNewTask({super.key});

  @override
  State<ListNewTask> createState() => _ListNewTaskState();
}

class _ListNewTaskState extends State<ListNewTask> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _taskDetails = {
    'title': '',
    'description': '',
    'todoList': '',
    'pay': 0,
    'location': {
      'streetAddress': '',
      'suburb': '',
      'city': '',
      'county': '',
    },
  };

  @override
  void initState() {
    super.initState();
    // Get user from user provider
    UserProvider userProvider = Provider.of<UserProvider>(
      context,
      listen: false,
    );
    User user = userProvider.user!;

    // Get default location from user
    _taskDetails['location'] = user.address.toMap();
  }

  void _createTask() {
    if (_formKey.currentState!.validate()) {
      showSnackBar(message: 'Creating task...');

      // Get user from user provider
      UserProvider userProvider = Provider.of<UserProvider>(
        context,
        listen: false,
      );
      User user = userProvider.user!;

      // Get database from database provider
      FirebaseFirestoreService database = Provider.of<FirebaseFirestoreService>(
        context,
        listen: false,
      );

      // Add the owner to the task details
      _taskDetails['ownerId'] = user.uid;

      // Convert pay to an integer
      _taskDetails['pay'] = int.parse(_taskDetails['pay']);

      // Convert todo to a map
      List<Map<String, dynamic>> todoList = List<Map<String, dynamic>>.from(
        _taskDetails['todoList']
            .split('\n')
            .map((String todo) => {'task': todo, 'done': false})
            .toList(),
      );

      // Add the todo list to the task details
      _taskDetails['todoList'] = todoList;

      // Create the task
      Task task = Task.fromMap(_taskDetails);

      // Add the task to the database
      database.createTask(task);

      showSnackBar(message: 'Task created successfully');
      Navigator.pop(context);
    }
  }

  void showSnackBar({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    User user = userProvider.user!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('List new task'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: CustomForm(
            formKey: _formKey,
            children: [
              CustomTextFormField(
                label: 'Title',
                validator: validateName,
                onChanged: (String value) => _taskDetails['title'] = value,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                label: 'Description',
                numberOfLines: 5,
                validator: validateName,
                onChanged: (String value) =>
                    _taskDetails['description'] = value,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                label: 'Pay',
                validator: validateName,
                onChanged: (String value) => _taskDetails['pay'] = value,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                label: 'To-do list',
                validator: (String? value) {
                  return null;
                },
                numberOfLines: 5,
                onChanged: (String value) => _taskDetails['todoList'] = value,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                label: 'Street Address',
                validator: validateName,
                initialValue: user.address.streetAddress,
                onChanged: (String value) =>
                    _taskDetails['location']['streetAddress'] = value,
              ),
              const SizedBox(height: ChindiSizes.spaceBtwItems),
              CustomTextFormField(
                label: 'Suburb',
                validator: validateName,
                initialValue: user.address.suburb,
                onChanged: (String value) =>
                    _taskDetails['location']['suburb'] = value,
              ),
              const SizedBox(height: ChindiSizes.spaceBtwItems),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      label: 'City',
                      validator: validateName,
                      initialValue: user.address.city,
                      onChanged: (String value) =>
                          _taskDetails['location']['city'] = value,
                    ),
                  ),
                  const SizedBox(width: ChindiSizes.spaceBtwItems),
                  Expanded(
                    child: CustomTextFormField(
                      label: 'County',
                      validator: validateName,
                      initialValue: user.address.county,
                      onChanged: (String value) =>
                          _taskDetails['location']['county'] = value,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: ChindiSizes.spaceBtwSections,
              ),
              ElevatedButton(
                onPressed: _createTask,
                child: const Text('Create task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
