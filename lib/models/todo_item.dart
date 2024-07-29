class TodoItem {
  String task;
  bool done;

  TodoItem({this.task = '', this.done = false});

  factory TodoItem.fromMap(Map<String, dynamic> todo) {
    return TodoItem(
      task: todo['task'],
      done: todo['done'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'task': task,
      'done': done,
    };
  }
}
