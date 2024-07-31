import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String url;
  final double size;
  const UserAvatar({
    super.key,
    required this.url,
    this.size = 15,
  });

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return CircleAvatar(
        radius: size,
        child: const Icon(
          Icons.person_rounded,
        ),
      );
    } else {
      return CircleAvatar(
        radius: size,
        backgroundImage: NetworkImage(url),
      );
    }
  }
}
