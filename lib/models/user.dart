import 'package:chindi/models/location.dart';

class User {
  final String? email;
  final String uid;
  String fullName;
  Location address;
  double rating;
  String avatarUrl;

  User({
    required this.fullName,
    this.email,
    required this.address,
    required this.uid,
    required this.rating,
    required this.avatarUrl,
  });

  factory User.fromMap(Map<String, dynamic> user) {
    return User(
      uid: user['uid'],
      fullName: user['fullName'],
      email: user['email'],
      address: Location.fromMap(user['address']),
      rating: user['rating'],
      avatarUrl: user['avatarUrl'],
    );
  }

  Map toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'email': email,
      'address': address.toMap(),
      'rating': rating,
      'avatarUrl': avatarUrl,
    };
  }
}
