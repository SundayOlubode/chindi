import 'package:chindi/components/tasks_list.dart';
import 'package:chindi/models/task.dart';
import 'package:chindi/models/user.dart';
import 'package:chindi/providers/user_provider.dart';
import 'package:chindi/services/firebase_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageTasks extends StatelessWidget {
  const ManageTasks({super.key});

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user!;
    FirebaseFirestoreService db =
        Provider.of<FirebaseFirestoreService>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Manage Tasks'),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Tasks created',
              ),
              Tab(
                text: 'Tasks assigned',
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBarView(
            children: [
              TasksListFutureBuilder(future: db.getTasksOwnedByUser(user)),
              TasksListFutureBuilder(future: db.getTasksPerformedByUser(user))
            ],
          ),
        ),
      ),
    );
  }
}

class TasksListFutureBuilder extends StatelessWidget {
  final Future<List<Task>> future;
  const TasksListFutureBuilder({
    super.key,
    required this.future,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        List<Task> tasksOwnedByUser = snapshot.data as List<Task>;

        return TasksList(tasks: tasksOwnedByUser);
      },
    );
  }
}
