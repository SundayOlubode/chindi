import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaskMenu extends StatelessWidget {
  final int color1 = int.parse('0xffFFC244');
  final int color2 = int.parse('0xff00A082');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(color1),
      body: Padding(
        padding: const EdgeInsets.all((30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 30.0,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(Icons.menu, size: 60),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            _buildSearchBar(context),
            Expanded(
              child: Container(),
            ),
            _buildTaskCategories(context),
            Expanded(
              child: Container(),
            ),
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildTaskCategoryContext('Laundry Pickup'),
            _buildTaskCategoryContext('Supermarket'),
            _buildTaskCategoryContext('Document Delivery'),
          ],
        ),
        Expanded(
          child: Container(),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildTaskCategoryContext('Grocery Shopping'),
            _buildTaskCategoryContext('Package Delivery'),
            _buildTaskCategoryContext('Water Pickup'),
          ],
        ),
      ],
    );
  }

  Widget _buildTaskCategoryContext(String text) {
    return Container(
      height: 100,
      width: 100,
      color: Color(color2),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildIcon(
          Icons.home,
          'Home',
        ),
        Expanded(
          child: Container(),
        ),
        _buildIcon(Icons.list_alt_outlined, 'List Job'),
        Expanded(
          child: Container(),
        ),
        _buildIcon(Icons.account_circle_rounded, 'Profile'),
      ],
    );
  }

  Widget _buildIcon(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Icon(icon, size: 40, color: Color(color2)),
          Text(text),
        ],
      ),
    );
  }
}
