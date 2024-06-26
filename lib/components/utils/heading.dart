import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String text;
  const Heading(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: -1,
      ),
    );
  }
}
