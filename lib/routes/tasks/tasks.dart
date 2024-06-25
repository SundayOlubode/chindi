import 'package:chindi_ke/components/tasks/task_display.dart';
import 'package:chindi_ke/components/utils/chindi_logo.dart';
import 'package:chindi_ke/components/custom_text_form_field.dart';
import 'package:chindi_ke/utils/constants/sizes.dart';
import 'package:chindi_ke/models/task.dart';
import 'package:flutter/material.dart';
import 'package:chindi_ke/utils/constants/tasks.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              ChindiLogo(
                height: 40,
                width: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomTextFormField(label: 'Search for tasks'),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Tasks near you',
            style: TextStyle(
              fontSize: ChindiSizes.fontSizeLg,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                Task task = tasks[index];
                return Column(children: [
                  TaskDisplay(task: task),
                  const SizedBox(
                    height: 20,
                  )
                ]);
              },
            ),
          )
        ],
      ),
    );
  }
}
