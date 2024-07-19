import 'package:chindi/components/user_profile_summary.dart';
import 'package:chindi/styles/text.dart';
import 'package:chindi/utils/helpers/create_location_description.dart';
import 'package:flutter/material.dart';
import 'package:chindi/models/task.dart' as m;
import 'package:chindi/routes/tasks/task_details.dart' as r;
import 'package:chindi/utils/helpers/format_currency.dart';
import 'package:chindi/utils/helpers/truncate_description.dart';

class TaskSummary extends StatelessWidget {
  final m.Task task;
  const TaskSummary({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return r.TaskDetails(
                task: task,
              );
            },
          ),
        );
      },
      child: Card(
        color: const Color.fromRGBO(246, 246, 246, 1),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: TextStyles.headingStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                formatCurrency(task.pay),
                style: TextStyles.currencyStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                truncateDescription(task.description, 150),
                style: TextStyles.bodyStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                createLocationDescription(task.location),
                style: TextStyles.subduedTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              UserProfileSummary(user: task.owner),
            ],
          ),
        ),
      ),
    );
  }
}
