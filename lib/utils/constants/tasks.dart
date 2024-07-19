import 'package:chindi/models/task.dart';
import 'package:chindi/models/location.dart';
import 'package:chindi/models/user.dart';
import 'package:chindi/models/todo_item.dart';

List<TodoItem> todoList = [
  TodoItem(task: 'Do the dishes'),
  TodoItem(task: 'Clean the sink'),
  TodoItem(task: 'Clean the counters'),
  TodoItem(task: 'Sweep the floor'),
  TodoItem(task: 'Mop the floor'),
];

Location taskLocation = const Location(
  streetAddress: '1 Mamlaka Road',
  suburb: 'Kilimani',
  city: 'Nairobi',
  county: 'Nairobi',
);

User taskOwner = User(
  firstName: 'Anesu',
  lastName: 'Kafesu',
  email: 'anesukafesu@example.com',
  location: taskLocation,
  uid: '123',
  rating: 4.5,
  avatarUrl: 'https://silver-sable-868cb1.netlify.app/team/anesu-kafesu.jpg',
);

Task task = Task(
  title: 'Kitchen Cleaning',
  pay: 800,
  description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sit amet arcu sit amet risus vulputate tristique ac vitae urna. Aenean id lacinia erat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque maximus justo quis arcu porttitor, et ultrices velit pellentesque',
  location: taskLocation,
  owner: taskOwner,
  todoList: todoList,
);

List<Task> tasks = [task, task, task];
