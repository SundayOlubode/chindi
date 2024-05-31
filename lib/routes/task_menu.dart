import 'package:flutter/material.dart';

class TaskMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 193, 68, 0),
      body: Padding(
        padding: const EdgeInsets.all((10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 30.0,
            ),
            _buildSearchBar(context),
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
}
