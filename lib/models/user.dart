import 'package:chindi/models/chat.dart';
import 'package:chindi/models/location.dart';
import 'package:chindi/services/firebase_firestore_service.dart';

class User {
  final String uid;
  final String email;
  String fullName;
  Location address;
  double rating;
  String avatarUrl;
  List<String> chatIds;
  List<Chat> chats;

  User({
    required this.uid,
    required this.fullName,
    required this.email,
    required this.address,
    required this.rating,
    required this.avatarUrl,
    this.chatIds = const [],
    this.chats = const [],
  });

  static Future<User> fromFirestore(
    String uid,
  ) async {
    // Get user data from Firebase
    FirebaseFirestoreService database = FirebaseFirestoreService();
    Map<String, dynamic> userData = await database.getUserData(uid);

    List<Chat> chats = await Future.wait(
      List<String>.from(userData['chatIds']).map(
        (chatId) => Chat.fromString(chatId, uid),
      ),
    );

    return User(
      uid: uid,
      fullName: userData['fullName'],
      email: userData['email'],
      address: Location.fromMap(userData['address']),
      rating: userData['rating'],
      avatarUrl: userData['avatarUrl'],
      chatIds: userData['chatIds'].cast<String>(),
      chats: chats,
    );
  }

  factory User.fromMap(Map<String, dynamic> user, String uid) {
    return User(
      uid: uid,
      fullName: user['fullName'],
      email: user['email'],
      address: Location.fromMap(user['address']),
      rating: user['rating'],
      avatarUrl: user['avatarUrl'],
      chatIds: (user['chatIds'] as List<dynamic>)
          .map((chat) => chat as String)
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'address': address.toMap(),
      'rating': rating,
      'avatarUrl': avatarUrl,
      'chatIds': chatIds,
    };
  }
}
