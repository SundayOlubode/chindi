import 'package:chindi/components/user_avatar.dart';
import 'package:chindi/models/chat.dart';
import 'package:chindi/models/user.dart';
import 'package:chindi/routes/chat_display.dart';
import 'package:chindi/services/firebase_firestore_service.dart';
import 'package:flutter/material.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    var database = FirebaseFirestoreService();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder(
        stream: database.user,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error occurred'),
            );
          } else if (snapshot.hasData) {
            User user = snapshot.data!;

            if (user.chatIds.isEmpty) {
              return const Center(
                child: Text('You have no chats with other users.'),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: user.chats.length,
                    itemBuilder: (context, index) {
                      Chat chat = user.chats[index];
                      String subtitle = '';
                      bool showAsUnread = false;
                      if (chat.latestMessage != null) {
                        if (chat.latestMessage!.senderId == user.uid) {
                          subtitle = 'You: ';
                        } else {
                          subtitle = '';
                        }
                        subtitle += chat.latestMessage!.text;
                      }

                      if (chat.latestMessage != null &&
                          chat.latestMessage!.senderId != user.uid &&
                          !chat.latestMessage!.isRead) {
                        showAsUnread = true;
                      }

                      return ListTile(
                        leading: UserAvatar(
                          url: chat.otherUserAvatarUrl,
                        ),
                        trailing: showAsUnread
                            ? const CircleAvatar(
                                radius: 5,
                                backgroundColor: Colors.blue,
                              )
                            : null,
                        title: Text(
                          chat.label,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.5,
                          ),
                        ),
                        subtitle: Text(
                          subtitle,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatDisplay(
                                chat: chat,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
