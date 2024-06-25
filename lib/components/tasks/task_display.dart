import 'package:chindi_ke/utils/helpers/create_location_description.dart';
import 'package:flutter/material.dart';
import 'package:chindi_ke/models/task.dart';
import 'package:chindi_ke/utils/helpers/format_currency.dart';
import 'package:chindi_ke/utils/helpers/truncate_description.dart';

class TaskDisplay extends StatelessWidget {
  final Task task;
  const TaskDisplay({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(246, 246, 246, 1),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              formatCurrency(task.pay),
              style: const TextStyle(
                color: Color.fromRGBO(80, 80, 80, 1),
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(truncateDescription(task.description, 150)),
            const SizedBox(
              height: 10,
            ),
            Text(
              createLocationDescription(task.location),
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  foregroundImage: NetworkImage(task.owner.avatarUrl),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${task.owner.firstName} ${task.owner.lastName}',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                      ),
                    ),
                    Text(
                      '${task.owner.rating} ${task.owner.rating == 1 ? 'star' : 'stars'}',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
