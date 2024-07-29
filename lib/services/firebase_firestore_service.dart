import 'package:chindi/models/task.dart';
import 'package:chindi/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirebaseFirestoreService {
  Map<String, User> _usersMap = {};
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference _tasksCollection =
      FirebaseFirestore.instance.collection('tasks');

  FirebaseFirestoreService() {
    // if (kDebugMode) {
    //   FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8088);
    // }

    _usersCollection.snapshots().listen((QuerySnapshot snapshot) {
      _usersMap = snapshotToUsersMap(snapshot);
    });
  }

  Stream<List<Task>> get tasks => FirebaseFirestore.instance
      .collection('tasks')
      .snapshots()
      .map(snapshotToTasks);

  List<Task> snapshotToTasks(QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic> taskData = doc.data();
      taskData['id'] = doc.id;
      taskData['owner'] = _usersMap[taskData['ownerId']]!.toMap();
      return Task.fromMap(taskData);
    }).toList();
  }

  Map<String, User> snapshotToUsersMap(
    QuerySnapshot snapshot,
  ) {
    Map<String, User> usersMap = {};

    for (var doc in snapshot.docs) {
      Map<String, dynamic> userData = doc.data() as Map<String, dynamic>;
      userData['uid'] = doc.id;
      usersMap[doc.id] = User.fromMap(userData);
    }

    return usersMap;
  }

  Future<void> setUserData(String uid, Map<String, dynamic> data) async {
    await _usersCollection.doc(uid).set(data);
  }

  Future<Object?> getUserData(String uid) async {
    var doc = await _usersCollection.doc(uid).get();
    return doc.data();
  }

  Future<void> updateUserDetails(String uid, Map<String, dynamic> data) async {
    await _usersCollection.doc(uid).update(data);
  }

  Future<void> createTask(Task task) async {
    // Convert the task to a map
    Map taskMap = task.toMap();

    // Add the id of the owner to the task map
    taskMap['ownerId'] = task.owner.uid;

    // Remove the owner from the task map
    taskMap.remove('owner');

    // Add the task map to the tasks collection
    await _tasksCollection.add(taskMap);
  }
}
