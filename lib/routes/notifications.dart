import 'package:flutter/material.dart';
import 'package:chindi/utils/helpers/create_time_description.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:chindi/utils/constants/notifications.dart';
import 'package:chindi/models/notification.dart' as n;
import 'package:chindi/routes/notification_view.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Notifications"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
        child: ListView.separated(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            n.Notification notification = notifications[index];
            return Slidable(
              endActionPane: ActionPane(
                extentRatio: .3,
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {},
                    icon: Icons.delete,
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                  ),
                ],
              ),
              child: ListTile(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return NotificationView(notification: notification);
                    },
                  );
                },
                title: Text(
                  notification.title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing: Text(
                  createTimeDescription(notification.createdAt),
                ),
                subtitle: Text(
                  notification.content,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(
            thickness: 1.0,
            color: Colors.grey[300],
            // indent: size.width * 0.08,
            // endIndent: size.width * 0.08,
          ),
        ),
      ),
    );
  }
}
