import 'package:chindi_ke/components/tasks_list.dart';
import 'package:chindi_ke/utils/constants/tasks.dart';
import 'package:flutter/material.dart';

class ManageTasks extends StatelessWidget {
  const ManageTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Manage Tasks'),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Tasks Created',
              ),
              Tab(
                text: 'Tasks Performed',
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBarView(
            children: [
              TasksList(tasks: tasks),
              TasksList(tasks: tasks),
            ],
          ),
        ),
      ),
    );
  }
}
