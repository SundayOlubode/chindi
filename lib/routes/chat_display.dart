import 'package:chindi/components/message_box.dart';
import 'package:chindi/components/messages_display.dart';
import 'package:chindi/components/user_avatar.dart';
import 'package:chindi/models/chat.dart';
import 'package:chindi/services/firebase_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatDisplay extends StatelessWidget {
  final Chat chat;

  const ChatDisplay({
    super.key,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    FirebaseFirestoreService database =
        Provider.of<FirebaseFirestoreService>(context);

    Future<bool> prepareChat() async {
      bool chatExists = await database.checkIfChatExists(
        chat,
      );

      if (!chatExists) {
        await database.createChat(
          chat,
        );
      }

      return true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            UserAvatar(
              url: chat.otherUserAvatarUrl,
            ),
            const SizedBox(width: 15),
            Text(chat.label),
          ],
        ),
      ),
      body: FutureBuilder(
        future: prepareChat(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error occurred'),
            );
          } else if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: MessagesDisplay(
                    chat: chat,
                  ),
                ),
                SafeArea(
                  bottom: true,
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: MessageBox(
                      chat: chat,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
