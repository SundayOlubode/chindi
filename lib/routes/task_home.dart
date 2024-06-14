import 'dart:math';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:chindi_ke/components/time_display.dart';
import 'package:chindi_ke/components/todo_list.dart';

class TaskHome extends StatefulWidget {
  const TaskHome({super.key});

  @override
  State<TaskHome> createState() => _TaskHomeState();
}

class _TaskHomeState extends State<TaskHome> {
  late ConfettiController _confettiController;
  final int _timeRemaining = 4 * 60 + 20;

  @override
  void initState() {
    super.initState();

    // initialize confettiController
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {
    _confettiController.dispose();
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
                    confettiController: _confettiController,
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
                  TodoList(
                    onTodoListComplete: () {
                      _confettiController.play();
                    },
                  ),
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
