import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chindi/models/user.dart ';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User> fetchUser(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();
    final data = doc.data()!;
    return User.fromMap(data, userId);
  }
}
