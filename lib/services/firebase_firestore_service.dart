import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore _database = FirebaseFirestore.instance;
  late CollectionReference _users;
  late CollectionReference _messages;
  late CollectionReference _taskRegistrations;
  late CollectionReference _tasks;
  late CollectionReference _globalNotifications;

  FirebaseFirestoreService() {
    if (kDebugMode) {
      _database.useFirestoreEmulator('localhost', 8088);
    }

    _users = _database.collection('users');
    _messages = _database.collection('messages');
    _taskRegistrations = _database.collection('task_registrations');
    _tasks = _database.collection('tasks');
    _globalNotifications = _database.collection('global_notifications');
  }

  Future<void> initialiseUser(
    String uid,
    Map<String, dynamic> initialData,
  ) async {
    await _users.doc(uid).set(initialData);
  }

  Future<Object?> getUserData(String uid) async {
    var doc = await _users.doc(uid).get();
    return doc.data();
  }

  Future<void> updateUserDetails(String uid, Map<String, dynamic> data) async {
    await _users.doc(uid).update(data);
  }
}
