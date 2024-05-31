import 'package:flutter/material.dart';

class TaskMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(0, 233, 174, 55),
      body: Padding(
        padding: const EdgeInsets.all((10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 30.0,
            ),
            _buildSearchBar(context),
            _buildTaskCategories(context),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return SearchBar(
      hintText: 'Search tasks...',
      leading: IconButton(
        onPressed: () => {},
        icon: const Icon(Icons.search),
      ),
      trailing: [
        IconButton(
          onPressed: () => {},
          icon: const Icon(Icons.mic),
        ),
      ],
    );
  }

  Widget _buildTaskCategories(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildTaskColumn(context),
        Expanded(
          child: Container(),
        ),
        _buildTaskColumn(context),
      ],
    );
  }

  Widget _buildTaskColumn(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 100,
          width: 100,
          child: Text(
            'Grocery Shopping',
          ),
        ),
        SizedBox(
          height: 100,
          width: 100,
          child: Text(
            'Grocery Shopping',
          ),
        ),
        SizedBox(
          height: 100,
          width: 100,
          child: Text(
            'Grocery Shopping',
          ),
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildIcon(Icons.home, 'Home'),
        _buildIcon(Icons.list_alt_outlined, 'List Job'),
        _buildIcon(Icons.account_circle_rounded, 'Profile'),
      ],
    );
  }

  Widget _buildIcon(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Icon(icon, size: 40),
          Text(text),
        ],
      ),
    );
  }
}
