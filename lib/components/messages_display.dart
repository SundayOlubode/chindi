import 'package:chindi/models/chat.dart';
import 'package:chindi/models/message.dart';
import 'package:chindi/models/user.dart';
import 'package:chindi/providers/user_provider.dart';
import 'package:chindi/services/firebase_firestore_service.dart';
import 'package:chindi/components/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessagesDisplay extends StatefulWidget {
  final Chat chat;
  const MessagesDisplay({
    super.key,
    required this.chat,
  });

  @override
  State<MessagesDisplay> createState() => _MessagesDisplayState();
}

class _MessagesDisplayState extends State<MessagesDisplay> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolledUp = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        setState(() {
          // If _scroll.position.pixels == 0, then the user is scrolled to the top
          _isScrolledUp = _scrollController.position.pixels == 0;
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestoreService database =
        Provider.of<FirebaseFirestoreService>(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: StreamBuilder(
        stream: database.createMessageStreamForChat(
          widget.chat,
        ),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<Message>> snapshot,
        ) {
          if (snapshot.hasData) {
            List<Message> messages = snapshot.data!;

            if (messages.isEmpty) {
              return Center(
                child: Text(
                  "You have not chatted with ${widget.chat.label} yet.",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              );
            }

            return ListView.builder(
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (BuildContext context, index) {
                Message message = messages[index];
                return MessageBubble(
                  message: message,
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('An error occurred'),
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
