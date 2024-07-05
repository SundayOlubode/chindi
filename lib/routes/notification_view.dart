import 'package:chindi_ke/utils/helpers/create_time_description.dart';
import 'package:flutter/material.dart';
import 'package:chindi_ke/models/notification.dart' as n;

class NotificationView extends StatelessWidget {
  final n.Notification notification;
  const NotificationView({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(notification.title),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              createTimeDescription(notification.createdAt),
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification.content),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
