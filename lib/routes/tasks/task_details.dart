import 'package:chindi_ke/components/todo_list.dart';
import 'package:chindi_ke/components/user_profile_summary.dart';
import 'package:chindi_ke/styles/text.dart';
import 'package:chindi_ke/utils/helpers/create_location_description.dart';
import 'package:chindi_ke/utils/helpers/format_currency.dart';
import 'package:flutter/material.dart';
import 'package:chindi_ke/models/task.dart' as m;

class TaskDetails extends StatelessWidget {
  final m.Task task;
  const TaskDetails({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Register for task'),
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
              height: 20,
            ),
            TodoList(
              todoList: task.todoList,
            )
          ],
        ),
      ),
    );
  }
}
