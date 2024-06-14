import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final void Function() onPressed;
  final String label;
  const SecondaryButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(label),
    );
  }
}
