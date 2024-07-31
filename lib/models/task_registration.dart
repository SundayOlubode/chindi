import 'package:chindi/models/user.dart';
import 'package:chindi/services/firebase_firestore_service.dart';

class TaskRegistration {
  final String taskId;
  final String userId;
  final User? user;

  TaskRegistration({
    required this.taskId,
    required this.userId,
    this.user,
  });

  factory TaskRegistration.fromMap(Map<String, dynamic> data) {
    return TaskRegistration(
      taskId: data['taskId'],
      userId: data['userId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'taskId': taskId,
      'userId': userId,
    };
  }

  static Future<TaskRegistration> fromFirestore(
    Map<String, dynamic> taskRegistrationData,
  ) async {
    var userMap = await FirebaseFirestoreService().getUserData(
      taskRegistrationData['userId'],
    );
    var user = User.fromMap(
      userMap,
      taskRegistrationData['userId'],
    );
    return TaskRegistration(
      taskId: taskRegistrationData['taskId'],
      userId: taskRegistrationData['userId'],
      user: user,
    );
  }
}
