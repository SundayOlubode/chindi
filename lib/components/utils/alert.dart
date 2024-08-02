import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  final String text;
  const Alert({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromARGB(255, 242, 236, 255),
        border: Border.all(
          color: const Color.fromARGB(255, 228, 214, 255),
        ),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 10.0,
        ),
        child: Text(text),
      ),
    );
  }
}
