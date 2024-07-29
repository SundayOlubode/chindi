import 'package:flutter/material.dart';
import 'package:chindi/models/user.dart';

class UserProfileSummary extends StatelessWidget {
  final User user;
  const UserProfileSummary({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    Widget avatar = user.avatarUrl.isEmpty
        ? const CircleAvatar(
            radius: 15,
            child: Icon(
              Icons.person_rounded,
            ),
          )
        : CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(user.avatarUrl),
          );
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          child: avatar,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.fullName,
              style: TextStyle(
                color: Colors.grey.shade800,
              ),
            ),
            Text(
              '${user.rating} ${user.rating == 1 ? 'star' : 'stars'}',
              style: TextStyle(
                color: Colors.grey.shade800,
              ),
            )
          ],
        )
      ],
    );
  }
}
