import 'package:chindi/components/tasks_list.dart';
import 'package:chindi/components/utils/chindi_logo.dart';
import 'package:chindi/components/utils/custom_text_form_field.dart';
import 'package:chindi/utils/constants/sizes.dart';
import 'package:chindi/utils/validators/validate_name.dart';
import 'package:flutter/material.dart';
import 'package:chindi/utils/constants/tasks.dart';

class Tasks extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const ChindiLogo(
                height: 40,
                width: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomTextFormField(
                  controller: _searchController,
                  label: 'Search for tasks',
                  prefixIcon: Icons.search,
                  validator: validateName,
                ),
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
          TasksList(tasks: tasks),
        ],
      ),
    );
  }
}
