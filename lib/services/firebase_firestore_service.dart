import 'package:chindi/models/chat.dart';
import 'package:chindi/models/location.dart';
import 'package:chindi/models/message.dart';
import 'package:chindi/models/task.dart';
import 'package:chindi/models/task_registration.dart';
import 'package:chindi/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class FirebaseFirestoreService {
  // Implementing singleton pattern for Database service
  static final instance = FirebaseFirestoreService._privateConstructor();
  factory FirebaseFirestoreService() => instance;
  FirebaseFirestoreService._privateConstructor();

  final String uid = firebase_auth.FirebaseAuth.instance.currentUser!.uid;
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference _tasksCollection =
      FirebaseFirestore.instance.collection('tasks');
  final CollectionReference _taskRegistrationsCollection =
      FirebaseFirestore.instance.collection('taskRegistrations');
  final DocumentReference _p2pChats =
      FirebaseFirestore.instance.collection('messages').doc('p2pChats');

  Stream<User> get user {
    return _usersCollection.doc(uid).snapshots().asyncMap((doc) async {
      return await User.fromFirestore(uid);
    });
  }

  Stream<Task> createTaskStream(String taskId) {
    return _tasksCollection
        .doc(taskId)
        .snapshots()
        .asyncMap(_convertSnapshotToTask);
  }

  Stream<List<TaskRegistration>> createTaskRegistrationsStreamForTask(
    String taskId,
  ) {
    return _taskRegistrationsCollection
        .where('taskId', isEqualTo: taskId)
        .snapshots()
        .asyncMap((snapshot) async {
      return await Future.wait(
        snapshot.docs.map(
          _convertDocToTaskRegistration,
        ),
      );
    });
  }

  Future<Task> _convertSnapshotToTask(DocumentSnapshot doc) {
    return Task.fromFirestore(doc.data() as Map<String, dynamic>, doc.id);
  }

  Future<Message> getLatestMessage(String chatId) async {
    QuerySnapshot messages = await _p2pChats
        .collection(chatId)
        .orderBy('createdAt', descending: true)
        .limit(1)
        .get();

    var message = messages.docs.first.data() as Map<String, dynamic>;

    message['createdAt'] = (message['createdAt'] as Timestamp).toDate();

    return Message.fromMap(message, messages.docs.first.id);
  }

  Stream<List<Task>> get tasks {
    return _tasksCollection.snapshots().asyncMap(_convertSnapshotToTasksList);
  }

  Future<String> getFullName(String uid) async {
    var doc = await _usersCollection.doc(uid).get();
    return (doc.data() as Map<String, dynamic>)['fullName'];
  }

  Future<String> getAvatarUrl(String uid) async {
    var doc = await _usersCollection.doc(uid).get();
    return (doc.data() as Map<String, dynamic>)['avatarUrl'];
  }

  Future<void> updateUserAddress(Location address) async {
    await _usersCollection.doc(uid).update({
      'address': address.toMap(),
    });
  }

  // Convert a snapshot to a list of Task models
  Future<List<Task>> _convertSnapshotToTasksList(QuerySnapshot snapshot) async {
    return await Future.wait(snapshot.docs.map(_convertSnapshotToTask));
  }

  // Set user data in Firestore
  Future<void> setUserData(String uid, Map<String, dynamic> data) async {
    await _usersCollection.doc(uid).set(data);
  }

  // Get user data from Firestore
  Future<Map<String, dynamic>> getUserData(String uid) async {
    var doc = await _usersCollection.doc(uid).get();
    return doc.data() as Map<String, dynamic>;
  }

  // Create a chat in Firestore
  Future<void> createChat(Chat chat) async {
    String primaryUserId = uid;
    String secondaryUserId = chat.otherUserId;

    // Generate a chat id
    final chatId = generateChatId(primaryUserId, secondaryUserId);

    // Add the chat to both users' chat lists
    await FirebaseFirestore.instance
        .collection('users')
        .doc(primaryUserId)
        .update({
      'chats': FieldValue.arrayUnion([chatId]),
    });
    await FirebaseFirestore.instance
        .collection('users')
        .doc(secondaryUserId)
        .update({
      'chats': FieldValue.arrayUnion([chatId]),
    });
  }

  // Checks if the chat exists in Firestore
  Future<bool> checkIfChatExists(Chat chat) async {
    String primaryUserId = uid;
    String secondaryUserId = chat.otherUserId;
    final chatId = generateChatId(primaryUserId, secondaryUserId);

    final user1Data = await getUserData(primaryUserId);
    final user2Data = await getUserData(secondaryUserId);

    return user1Data['chatIds'].contains(chatId) &&
        user2Data['chatIds'].contains(chatId);
  }

  // Update user details in Firestore
  Future<void> updateUserDetails(String uid, Map<String, dynamic> data) async {
    await _usersCollection.doc(uid).update(data);
  }

  // Create a new task in Firestore
  Future<void> createTask(Task task) async {
    final taskMap = task.toMap();
    await _tasksCollection.add(taskMap);
  }

  // Register a user for a task in Firestore
  Future<void> registerForTask(String taskId) async {
    await _taskRegistrationsCollection.add({
      'taskId': taskId,
      'userId': uid,
    });
  }

  Future<TaskRegistration> _convertDocToTaskRegistration(
    DocumentSnapshot doc,
  ) async {
    final registrationData = doc.data() as Map<String, dynamic>;
    return await TaskRegistration.fromFirestore(
      registrationData,
    );
  }

  // Get task registrations for a specific task
  Future<List<TaskRegistration>> getTaskRegistrationsForTask(
      String taskId) async {
    final snapshot = await _taskRegistrationsCollection
        .where('taskId', isEqualTo: taskId)
        .get();

    return await Future.wait(snapshot.docs.map(_convertDocToTaskRegistration));
  }

  // Get tasks performed by a user
  Future<List<Task>> getTasksPerformedByUser(User user) async {
    final snapshot =
        await _tasksCollection.where('assignedToId', isEqualTo: user.uid).get();
    return _convertSnapshotToTasksList(snapshot);
  }

  // Get tasks owned by a user
  Future<List<Task>> getTasksOwnedByUser(User user) async {
    final snapshot =
        await _tasksCollection.where('ownerId', isEqualTo: user.uid).get();
    return _convertSnapshotToTasksList(snapshot);
  }

  // Assign a task to a user
  Future<void> assignTask(String taskId, String userId) async {
    await _tasksCollection.doc(taskId).update({
      'assignedToId': userId,
    });
  }

  // Send a message in a chat
  Future<void> sendMessage(Message message) async {
    final chatId = generateChatId(message.senderId, message.receiverId);
    await _p2pChats.collection(chatId).add(message.toMap());
  }

  // Stream messages for a chat
  Stream<List<Message>> createMessageStreamForChat(
    Chat chat,
  ) {
    final primaryUserId = uid;
    final secondaryUserId = chat.otherUserId;
    final chatId = generateChatId(primaryUserId, secondaryUserId);

    return _p2pChats
        .collection(chatId)
        .orderBy('createdAt')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final messageData = doc.data();
        messageData['uid'] = doc.id;
        messageData['createdAt'] =
            (messageData['createdAt'] as Timestamp).toDate();
        return Message.fromMap(messageData, doc.id);
      }).toList();
    });
  }

  // Generate a chat ID for two users
  String generateChatId(String primaryUserId, String secondaryUserId) {
    final uids = [primaryUserId, secondaryUserId]..sort();
    return uids.join('_');
  }
}
