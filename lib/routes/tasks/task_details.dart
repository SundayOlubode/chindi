import 'package:chindi/components/todo_lists/general_todo_list.dart';
import 'package:chindi/components/todo_lists/todo_list_for_assignee.dart';
import 'package:chindi/components/todo_lists/todo_list_for_task_owner.dart';
import 'package:chindi/components/todo_lists/todo_list_wrapper.dart';
import 'package:chindi/components/user_profile_summary.dart';
import 'package:chindi/models/user.dart';
import 'package:chindi/providers/user_provider.dart';
import 'package:chindi/services/firebase_firestore_service.dart';
import 'package:chindi/utils/styles/text.dart';
import 'package:chindi/utils/helpers/create_location_description.dart';
import 'package:chindi/utils/helpers/format_currency.dart';
import 'package:flutter/material.dart';
import 'package:chindi/models/task.dart';
import 'package:provider/provider.dart';
import 'package:chindi/components/task_registrations_display.dart';

class TaskDetails extends StatelessWidget {
  final Task task;
  const TaskDetails({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var firebaseFirestoreService = Provider.of<FirebaseFirestoreService>(
      context,
      listen: false,
    );

    void registerForTask() {
      // Implement registration logic here
      firebaseFirestoreService.registerForTask(
        task,
        userProvider.user!,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: registerForTask,
        label: const Text(
          'Register for task',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: TextStyles.headingStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            UserProfileSummary(user: task.owner),
            const SizedBox(
              height: 20,
            ),
            Text(
              task.description,
              style: TextStyles.bodyStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Location: ${createLocationDescription(task.location)}',
              style: TextStyles.subduedTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              formatCurrency(task.pay),
              style: TextStyles.currencyStyle,
            ),
            const SizedBox(
              height: 30,
            ),
            if (userProvider.user!.uid == task.owner.uid &&
                task.assignedTo == null)
              TaskRegistrationsDisplay(task: task),
            const SizedBox(
              height: 30,
            ),
            TodoListWrapper(
              task: task,
              currentUser: userProvider.user!,
            ),
          ],
        ),
      ),
    );
  }
}
