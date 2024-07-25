import 'package:chindi/models/location.dart';
import 'package:firebase_auth/firebase_auth.dart' as f;

class User {
  final String fullName;
  final String email;
  final String uid;
  final Location location;
  final double rating;
  final String avatarUrl;

  const User({
    required this.fullName,
    required this.email,
    required this.location,
    required this.uid,
    required this.rating,
    required this.avatarUrl,
  });

  factory User.fromFirebase(
    f.User firebaseUser,
    Map<String, dynamic> userData,
  ) {
    return User(
      uid: firebaseUser.uid,
      fullName: firebaseUser.displayName ?? '',
      email: firebaseUser.email ?? '',
      avatarUrl: firebaseUser.photoURL ?? '',
      location: Location.fromMap(
        Map<String, String>.from(userData['address']),
      ),
      rating: userData['rating'],
    );
  }
}
