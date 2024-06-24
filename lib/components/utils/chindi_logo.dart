import 'package:flutter/material.dart';

class ChindiLogo extends StatelessWidget {
  final double? width;
  final double? height;

  const ChindiLogo({
    super.key,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 150,
      height: height ?? 150,
      child: const ClipOval(
        child: Image(
          image: AssetImage('assets/images/logo.png'),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
