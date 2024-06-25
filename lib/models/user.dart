import 'package:chindi_ke/models/location.dart';

class User {
  final String firstName;
  final String lastName;
  final String email;
  final String uid;
  final Location location;
  final double rating;
  final String avatarUrl;

  const User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.location,
    required this.uid,
    required this.rating,
    required this.avatarUrl,
  });
}
