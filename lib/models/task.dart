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
}
