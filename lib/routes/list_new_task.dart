import 'package:chindi_ke/utils/constants/sizes.dart';
import 'package:chindi_ke/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';

class FormValidation extends StatefulWidget {
  const FormValidation({super.key});

  @override
  State<FormValidation> createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  final _formKey = GlobalKey<FormState>();

  // Focus Node
  final _focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    // Current Text theme
    final TextTheme globalTextTheme = Theme.of(context).textTheme;
    // Current elevated button theme
    // final ButtonStyle? globalButtonStyle =
        Theme.of(context).elevatedButtonTheme.style;

    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(ChindiSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    // PAGE HEADLINE
                    Text(
                      ChindiTexts.heading,
                      style: globalTextTheme.headlineMedium,
                    ),
                    const SizedBox(height: ChindiSizes.spaceBtwItems),
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
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                            }
                          },
                          child: const Text('Create Job'),
                        ),
                        const SizedBox(width: 25),
                        ElevatedButton(
                          onPressed: () {
                            // Reset Form
                            _formKey.currentState!.reset();
                            //Focus to the Title
                            _focus.requestFocus();
                          },
                          child: const Text('Reset'),
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
