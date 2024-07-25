import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDatabaseService {
  final _users = FirebaseFirestore.instance.collection('users');

  Future<void> initialiseUser(
    String uid,
    Map<String, dynamic> initialData,
  ) async {
    await _users.doc(uid).set(initialData);
  }

  Future<Map<String, dynamic>?> getUserData(String uid) async {
    var doc = await _users.doc(uid).get();
    return doc.data();
  }
}
