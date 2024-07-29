import 'package:chindi/components/list_new_task_fab.dart';
import 'package:chindi/routes/profile/user_profile.dart';
import 'package:chindi/routes/tasks/tasks.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void _handleTabChange() {
    setState(() {
      // Triggering a rebuild
    });
  }

  bool _showFab() {
    return _tabController.index == 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            Tasks(),
            UserProfile(),
          ],
        ),
      ),
      floatingActionButton: _showFab() ? const ListNewTaskFab() : null,
      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: const [
          Tab(
            icon: Icon(Icons.task_rounded),
          ),
          Tab(
            icon: Icon(Icons.person_rounded),
          ),
        ],
      ),
    );
  }
}
