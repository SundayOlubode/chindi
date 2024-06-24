import 'package:chindi_ke/models/location.dart';
import 'package:chindi_ke/models/todo_item.dart';
import 'package:chindi_ke/models/user.dart';

class Task {
  final String title;
  final double pay;
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
