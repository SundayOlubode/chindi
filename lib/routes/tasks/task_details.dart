import 'package:chindi/components/todo_lists/todo_list_wrapper.dart';
import 'package:chindi/components/user_profile_summary.dart';
import 'package:chindi/components/utils/alert.dart';
import 'package:chindi/models/chat.dart';
import 'package:chindi/models/task_registration.dart';
import 'package:chindi/providers/user_provider.dart';
import 'package:chindi/routes/chat_display.dart';
import 'package:chindi/routes/registered_succesfully.dart';
import 'package:chindi/services/firebase_firestore_service.dart';
import 'package:chindi/utils/styles/text.dart';
import 'package:chindi/utils/helpers/create_location_description.dart';
import 'package:chindi/utils/helpers/format_currency.dart';
import 'package:flutter/material.dart';
import 'package:chindi/models/task.dart';
import 'package:provider/provider.dart';
import 'package:chindi/components/task_registrations_display.dart';
import 'package:rxdart/rxdart.dart';

class TaskDetails extends StatelessWidget {
  final String taskId;
  const TaskDetails({
    super.key,
    required this.taskId,
  });

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context).user!;
    final FirebaseFirestoreService database = FirebaseFirestoreService();

    void registerForTask() async {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registering you for the task'),
        ),
      );

      await database.registerForTask(
        taskId,
      );

      if (context.mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const RegisteredSuccesfully(),
          ),
        );
      }
    }

    return StreamBuilder(
      stream: CombineLatestStream.list([
        database.createTaskStream(taskId),
        database.createTaskRegistrationsStreamForTask(taskId),
      ]),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text('Something went wrong.'),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        Task task = snapshot.data![0] as Task;
        List<TaskRegistration> taskRegistrations =
            snapshot.data![1] as List<TaskRegistration>;

        bool isTaskOwner = task.owner!.uid == user.uid;
        bool isTaskAssigned = task.assignedTo != null;
        bool isAlreadyRegistered = taskRegistrations.any(
          (taskRegistration) => taskRegistration.userId == user.uid,
        );

        bool showRegistrationButton =
            !isTaskOwner && !isTaskAssigned && !isAlreadyRegistered;

        bool showRegistrations = isTaskOwner && !isTaskAssigned;

        bool userIsAssignedToTask = task.assignedTo?.uid == user.uid;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Task Details'),
          ),
          floatingActionButton: showRegistrationButton
              ? FloatingActionButton.extended(
                  backgroundColor: Theme.of(context).primaryColor,
                  onPressed: registerForTask,
                  label: const Text(
                    'Register for task',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : null,
          body: SingleChildScrollView(
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
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Posted by:'),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          UserProfileSummary(user: task.owner!),
                          if (task.ownerId != user.uid)
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChatDisplay(
                                      chat: Chat(
                                        uid: database.generateChatId(
                                          user.uid,
                                          task.ownerId,
                                        ),
                                        label: task.owner!.fullName,
                                        otherUserId: task.ownerId,
                                        otherUserAvatarUrl:
                                            task.owner!.avatarUrl,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: const Text(
                                'Send Message',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            )
                        ],
                      ),
                    ],
                  ),
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
                  // Displayed only if the user is the task owner and the task is not assigned to anyone
                  if (showRegistrations) ...[
                    const SizedBox(
                      height: 30,
                    ),
                    TaskRegistrationsDisplay(
                      taskRegistrations: taskRegistrations,
                      taskId: task.uid!,
                    ),
                  ],

                  // Displayed only if user is the task owner and the task has been assigned to someone
                  if (isTaskOwner && isTaskAssigned) ...[
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Assigned to:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    UserProfileSummary(user: task.assignedTo!),
                  ],

                  if (isAlreadyRegistered && !isTaskAssigned) ...[
                    const SizedBox(
                      height: 20,
                    ),
                    const Alert(
                        text: 'You have already registered for this task'),
                  ],

                  if (userIsAssignedToTask) ...[
                    const SizedBox(
                      height: 20,
                    ),
                    const Alert(text: 'You have been assigned to this task'),
                  ],
                  const SizedBox(
                    height: 20,
                  ),
                  TodoListWrapper(
                    task: task,
                    currentUser: user,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
