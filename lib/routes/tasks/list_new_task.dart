import 'package:chindi_ke/utils/constants/sizes.dart';
import 'package:chindi_ke/utils/constants/texts.dart';
import 'package:flutter/material.dart';

class ListNewTask extends StatefulWidget {
  const ListNewTask({super.key});

  @override
  State<ListNewTask> createState() => _ListNewTaskState();
}

class _ListNewTaskState extends State<ListNewTask> {
  final _formKey = GlobalKey<FormState>();

  // Focus Node
  final _focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    // Current elevated button theme
    // final ButtonStyle? globalButtonStyle =
    Theme.of(context).elevatedButtonTheme.style;

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(ChindiSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    //Form
                    TextFormField(
                      autofocus: true,
                      focusNode: _focus,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Title';
                        }
                        return null;
                      },
                      maxLength: 30,
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Location',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Location';
                        }
                        return null;
                      },
                      maxLength: 50,
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Description',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Task Description';
                        }
                        return null;
                      },
                      maxLength: 250,
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'To-do List',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter To-do List';
                        }
                        return null;
                      },
                      maxLength: 500,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {}
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(120, 50),
                          ),
                          child: const Text('Create Job'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
