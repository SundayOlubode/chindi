import 'package:chindi/components/user_profile_summary.dart';
import 'package:chindi/models/task_registration.dart';
import 'package:chindi/services/firebase_firestore_service.dart';
import 'package:flutter/material.dart';

class TaskRegistrationsDisplay extends StatelessWidget {
  final List<TaskRegistration> taskRegistrations;
  final String taskId;
  const TaskRegistrationsDisplay({
    super.key,
    required this.taskId,
    required this.taskRegistrations,
  });

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestoreService database = FirebaseFirestoreService();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Registrations',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: taskRegistrations.map((registration) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UserProfileSummary(
                  user: registration.user!,
                ),
                TextButton(
                  onPressed: () async {
                    AlertDialog confirmAssignmentDialog = AlertDialog(
                      title: const Text('Confirm Assignment'),
                      content: Text(
                          'Are you sure you want to assign ${registration.user!.fullName}?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          child: const Text('Assign'),
                        )
                      ],
                    );

                    bool shouldAssign = await showDialog(
                      context: context,
                      builder: (context) {
                        return confirmAssignmentDialog;
                      },
                    );

                    if (shouldAssign) {
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('Assigning ${registration.user!.fullName}.'),
                        ),
                      );

                      await database.assignTask(
                        taskId,
                        registration.userId,
                      );

                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('Assigned ${registration.user!.fullName}.'),
                        ),
                      );
                    }
                  },
                  child: const Text('Assign'),
                ),
              ],
            );
          }).toList(),
        )
      ],
    );
  }
}
