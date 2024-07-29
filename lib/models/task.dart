import 'package:chindi/models/location.dart';
import 'package:chindi/models/todo_item.dart';
import 'package:chindi/models/user.dart';

class Task {
  final String title;
  final int pay;
  final String description;
  final List<TodoItem> todoList;
  final Location location;
  final User owner;

  const Task({
    required this.title,
    required this.pay,
    required this.description,
    required this.location,
    required this.owner,
    required this.todoList,
  });

  factory Task.fromMap(Map<String, dynamic> task) {
    return Task(
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
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'pay': pay,
      'description': description,
      'location': location.toMap(),
      'owner': owner.toMap(),
      'toDoList': todoList.map((todo) => todo.toMap()).toList(),
    };
  }
}
