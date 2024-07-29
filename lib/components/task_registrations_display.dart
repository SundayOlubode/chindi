import 'package:chindi/components/user_profile_summary.dart';
import 'package:chindi/models/task.dart';
import 'package:chindi/models/task_registration.dart';
import 'package:chindi/services/firebase_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskRegistrationsDisplay extends StatelessWidget {
  const TaskRegistrationsDisplay({
    super.key,
    required this.task,
  });
  final Task task;

  @override
  Widget build(BuildContext context) {
    var firebaseFirestoreService = Provider.of<FirebaseFirestoreService>(
      context,
      listen: false,
    );
    return FutureBuilder(
      future: firebaseFirestoreService.getTaskRegistrationsForTask(
        task,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return const Text('An error occurred');
        }
        var taskRegistrations = snapshot.data as List<TaskRegistration>;
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
            ...taskRegistrations.map((registration) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserProfileSummary(
                    user: registration.registrant,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Assign'),
                  ),
                ],
              );
            }),
          ],
        );
      },
    );
  }
}
