import 'dart:math';

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class TaskHome extends StatefulWidget {
  const TaskHome({super.key});

  @override
  State<TaskHome> createState() => _TaskHomeState();
}

class _TaskHomeState extends State<TaskHome> {
  late ConfettiController _centerController;
  final int _timeRemaining = 4 * 60 + 20;

  @override
  void initState() {
    super.initState();

    // initialize confettiController
    _centerController =
        ConfettiController(duration: const Duration(seconds: 10));
    _centerController.play();
  }

  @override
  void dispose() {
    // dispose the controller
    _centerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: const Text(
          'Task',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          height: 600,
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ConfettiWidget(
                    confettiController: _centerController,
                    blastDirection: pi / 2,
                    maxBlastForce: 5,
                    minBlastForce: 1,
                    emissionFrequency: 0.03,
                    numberOfParticles: 10,
                    shouldLoop: false,
                    gravity: 0,
                  ),
                  const Text('Time Remaining'),
                  TimeDisplay(time: _timeRemaining),
                  const SizedBox(
                    height: 20,
                  ),
                  const TodoList(),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.message_outlined,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Chat with task owner',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<TodoItem> todos = [
    TodoItem(task: 'Wash the dishes.'),
    TodoItem(task: 'Store away the dishes.'),
    TodoItem(task: 'Clean the counters'),
    TodoItem(task: 'Clean the stovetop.'),
    TodoItem(task: 'Clean the oven.'),
    TodoItem(task: 'Sweep the kitchen floor.'),
    TodoItem(task: 'Mop the floor.'),
    TodoItem(task: 'Take out the trash bag from the bin.'),
    TodoItem(task: 'Replace the trash bag in the bin.'),
    TodoItem(task: 'Wash the dishtowels.')
  ];

  @override
  Widget build(BuildContext context) {
    int numberOfItemsDone = 0;
    for (TodoItem todo in todos) {
      if (todo.done) {
        numberOfItemsDone += 1;
      }
    }
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'To-do List',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text('Done $numberOfItemsDone / ${todos.length} tasks.'),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, int index) {
                TodoItem todo = todos[index];
                return ListTile(
                  onTap: () {
                    setState(() {
                      todo.toggle();
                    });
                  },
                  leading: Icon(
                    todo.done
                        ? Icons.check_box_outlined
                        : Icons.check_box_outline_blank_outlined,
                  ),
                  title: Text(
                    todo.task,
                    style: TextStyle(
                      decoration: todo.done
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: todo.done
                          ? Colors.grey.shade700
                          : Colors.grey.shade900,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TodoItem {
  final String task;
  bool done;

  TodoItem({required this.task, this.done = false});

  void toggle() {
    done = !done;
  }
}

class TimeDisplay extends StatelessWidget {
  final int time;
  const TimeDisplay({super.key, required this.time});

  FormattedTime _formatTime(int time) {
    return FormattedTime(hours: time ~/ 60, minutes: time % 60);
  }

  @override
  Widget build(BuildContext context) {
    FormattedTime formattedTime = _formatTime(time);
    String hours = formattedTime.hours.toString().padLeft(2, '0');
    String minutes = formattedTime.minutes.toString().padRight(2, '0');

    return Text(
      '$hours:$minutes',
      style: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class FormattedTime {
  final int hours;
  final int minutes;

  const FormattedTime({required this.hours, required this.minutes});
}
