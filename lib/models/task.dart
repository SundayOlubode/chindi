import 'package:chindi/models/location.dart';
import 'package:chindi/models/todo_item.dart';
import 'package:chindi/models/user.dart';

class Task {
  final String? uid;
  final String title, description;
  final int pay;
  final List<TodoItem> todoList;
  final Location location;
  final User owner;
  final User? assignedTo;

  const Task({
    this.uid,
    required this.title,
    required this.pay,
    required this.description,
    required this.location,
    required this.owner,
    required this.todoList,
    this.assignedTo,
  });

  factory Task.fromMap(Map<String, dynamic> task) {
    return Task(
      uid: task['uid'],
      title: task['title'],
      pay: task['pay'],
      description: task['description'],
      location: Location.fromMap(task['location']),
      owner: User.fromMap(Map<String, dynamic>.from(task['owner'])),
      todoList: task['toDoList']
          .map<TodoItem>(
            (todo) => TodoItem.fromMap(todo),
          )
          .toList(),
      assignedTo: task['assignedTo'] == null
          ? null
          : User.fromMap(
              Map<String, dynamic>.from(
                task['assignedTo'],
              ),
            ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'title': title,
      'pay': pay,
      'description': description,
      'location': location.toMap(),
      'owner': owner.toMap(),
      'toDoList': todoList.map((todo) => todo.toMap()).toList(),
      'assignedTo': assignedTo?.toMap(),
    };
  }
}
