import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final void Function() onPressed;
  final String label;
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 15, horizontal: 0),
        ),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
        backgroundColor: WidgetStatePropertyAll(Theme.of(context).primaryColor),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
