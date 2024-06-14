class TodoItem {
  final String task;
  bool done;

  TodoItem({required this.task, this.done = false});

  void toggle() {
    done = !done;
  }
}
