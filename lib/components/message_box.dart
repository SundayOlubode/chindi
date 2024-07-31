import 'package:chindi/models/chat.dart';
import 'package:chindi/models/message.dart';
import 'package:chindi/models/user.dart';
import 'package:chindi/providers/user_provider.dart';
import 'package:chindi/services/firebase_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageBox extends StatefulWidget {
  final Chat chat;
  const MessageBox({
    super.key,
    required this.chat,
  });

  @override
  State<MessageBox> createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestoreService database =
        Provider.of<FirebaseFirestoreService>(context);
    User user = Provider.of<UserProvider>(context).user!;

    Future<void> sendMessage() async {
      if (_messageController.text.isEmpty) {
        return;
      }

      String message = _messageController.text;
      _messageController.text = '';

      try {
        await database.sendMessage(Message(
          createdAt: DateTime.now(),
          senderId: user.uid,
          receiverId: widget.chat.otherUserId,
          text: message,
        ));
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to send message. Please try again'),
            ),
          );
        }
        _messageController.text = message;
      }
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              textInputAction: TextInputAction.send,
              onSubmitted: (value) {
                sendMessage();
              },
              decoration: const InputDecoration(
                hintText: 'Type message...',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: sendMessage,
          ),
        ],
      ),
    );
  }
}
