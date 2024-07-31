import 'package:chindi/models/location.dart';
import 'package:chindi/models/todo_item.dart';
import 'package:chindi/models/user.dart';
import 'package:chindi/services/firebase_firestore_service.dart';

class Task {
  final String? uid;
  final String title;
  final String description;
  final int pay;
  final List<TodoItem> todoList;
  final Location location;
  final String ownerId;
  final String? assignedToId;
  User? owner;
  User? assignedTo;

  Task({
    this.uid,
    required this.title,
    required this.pay,
    required this.description,
    required this.location,
    required this.ownerId,
    required this.todoList,
    this.assignedToId,
    this.owner,
    this.assignedTo,
  });

  factory Task.fromMap(Map<String, dynamic> task, {uid}) {
    return Task(
      uid: uid,
      title: task['title'],
      pay: task['pay'],
      description: task['description'],
      location: Location.fromMap(task['location']),
      ownerId: task['ownerId'],
      todoList: (task['todoList'] as List<dynamic>)
          .map((todo) => TodoItem.fromMap(todo))
          .toList(),
      assignedToId: task['assignedToId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'pay': pay,
      'description': description,
      'location': location.toMap(),
      'ownerId': ownerId,
      'todoList': todoList.map((todo) => todo.toMap()).toList(),
      'assignedToId': assignedToId,
    };
  }

  static Future<Task> fromFirestore(
    Map<String, dynamic> taskData,
    String uid,
  ) async {
    FirebaseFirestoreService database = FirebaseFirestoreService();
    final task = Task.fromMap(taskData, uid: uid);

    Map<String, dynamic>? ownerData = await database.getUserData(task.ownerId);

    // Fetch and resolve owner
    task.owner = User.fromMap(ownerData!, task.ownerId);

    // Fetch and resolve assignedTo if it exists
    if (task.assignedToId != null) {
      Map<String, dynamic>? assignedToData = await database.getUserData(
        task.assignedToId!,
      );
      task.assignedTo = User.fromMap(assignedToData, task.assignedToId!);
    }

    return task;
  }
}
