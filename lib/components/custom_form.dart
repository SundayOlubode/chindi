import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final List<Widget> children;
  const CustomForm({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
