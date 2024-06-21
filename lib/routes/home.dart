import 'package:chindi_ke/routes/profile/user_profile.dart';
import 'package:chindi_ke/routes/tasks/list_new_task.dart';
import 'package:chindi_ke/routes/tasks/tasks.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> _tabs = const [
    {
      'title': 'Tasks',
      'showTitle': false,
      'widget': Tasks(),
    },
    {
      'title': 'Create New Task',
      'showTitle': true,
      'widget': ListNewTask(),
    },
    {
      'title': 'Manage Profile',
      'showTitle': true,
      'widget': UserProfile(),
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((tab) => tab['widget'] as Widget).toList(),
      ),
      appBar: _tabs[_tabController.index]['showTitle']
          ? AppBar(
              title: Text(_tabs[_tabController.index]['title']),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          _tabController.animateTo(1);
        },
        label: Text(
          'List new task',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        icon: Icon(
          Icons.add_task,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Colors.white,
        padding: const EdgeInsets.all(0),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Color.fromARGB(255, 224, 224, 224)),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    _tabController.animateTo(0);
                  },
                  icon: const Icon(Icons.task),
                ),
                IconButton(
                  onPressed: () {
                    _tabController.animateTo(2);
                  },
                  icon: const Icon(Icons.person),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
