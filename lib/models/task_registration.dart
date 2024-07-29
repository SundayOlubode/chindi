import 'package:chindi/models/task.dart';
import 'package:chindi/models/user.dart';

class TaskRegistration {
  final String uid;
  final Task task;
  final User registrant;

  const TaskRegistration({
    required this.uid,
    required this.task,
    required this.registrant,
  });

  factory TaskRegistration.fromMap(Map<String, dynamic> taskRegistration) {
    return TaskRegistration(
      uid: taskRegistration['uid'],
      task: Task.fromMap(Map<String, dynamic>.from(taskRegistration['task'])),
      registrant: User.fromMap(
        Map<String, dynamic>.from(taskRegistration['registrant']),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'task': task.toMap(),
      'registrant': registrant.toMap(),
    };
  }
}
