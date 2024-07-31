import 'package:chindi/models/message.dart';
import 'package:chindi/services/firebase_firestore_service.dart';

class Chat {
  final String label;
  final String uid;
  final String otherUserId;
  final String otherUserAvatarUrl;
  final Message? latestMessage;

  Chat({
    required this.label,
    required this.uid,
    required this.otherUserId,
    required this.otherUserAvatarUrl,
    this.latestMessage,
  });

  static Future<Chat> fromString(
    String chatRepr,
    String currentUserId,
  ) async {
    // Get Database instance
    FirebaseFirestoreService database = FirebaseFirestoreService();

    // Splitting the string where there is an underscore
    final List<String> chatParts = chatRepr.split('_');

    // Get the other user's ID, i.e. the one that's not the currentUser's
    final String otherUserId = chatParts.firstWhere(
      (part) => part != currentUserId,
    );

    // Get the other user's name
    final String otherUserName = await database.getFullName(otherUserId);

    // Get the other user's avatar URL
    final String otherUserAvatarUrl = await database.getAvatarUrl(otherUserId);

    // Get the lates message in the chat
    final Message latestMessage = await database.getLatestMessage(chatRepr);

    // We return a Chat object with the other user's full name as the label
    return Chat(
      label: otherUserName,
      uid: chatRepr,
      otherUserId: otherUserId,
      otherUserAvatarUrl: otherUserAvatarUrl,
      latestMessage: latestMessage,
    );
  }
}
