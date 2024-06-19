import 'package:flutter/material.dart';

class OnTapHandler extends StatelessWidget {
  const OnTapHandler({
    super.key,
    required this.context,
    required this.dest,
    required this.child,
  });

  final BuildContext context;
  final Widget child;
  final Widget dest;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => dest,
          ),
        );
      },
      child: child,
    );
  }
}
