import 'package:chindi/models/message.dart';
import 'package:chindi/services/firebase_firestore_service.dart';
import 'package:chindi/utils/helpers/create_time_description.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    FirebaseFirestoreService database = FirebaseFirestoreService();
    bool isOwnMessage = message.senderId == database.uid;
    double borderRadius = 20;
    MainAxisAlignment messageBubbleAlignment =
        isOwnMessage ? MainAxisAlignment.end : MainAxisAlignment.start;

    Color messageBubbleBackgroundColor = isOwnMessage
        ? const Color.fromARGB(255, 237, 228, 255)
        : const Color.fromARGB(255, 238, 238, 238);

    BorderRadius messageBubbleBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(borderRadius),
      topRight: Radius.circular(borderRadius),
      bottomLeft: Radius.circular(isOwnMessage ? borderRadius : 0),
      bottomRight: Radius.circular(isOwnMessage ? 0 : borderRadius),
    );

    Alignment messageTimeAlignment =
        isOwnMessage ? Alignment.centerRight : Alignment.centerLeft;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: messageBubbleAlignment,
        children: [
          Dismissible(
            key: Key(message.id!),
            confirmDismiss: (DismissDirection direction) async {
              return false;
            },
            background: Container(
              alignment: messageTimeAlignment,
              child: Text(
                createTimeDescription(message.createdAt),
              ),
            ),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.8,
              ),
              decoration: BoxDecoration(
                color: messageBubbleBackgroundColor,
                borderRadius: messageBubbleBorderRadius,
              ),
              child: IntrinsicWidth(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 15,
                  ),
                  child: Text(message.text),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
