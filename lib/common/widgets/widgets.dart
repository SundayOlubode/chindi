import 'package:flutter/material.dart';

class ChindiIcon extends StatelessWidget {
  const ChindiIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 150,
      height: 150,
      child: ClipOval(
        child: Image(
          image: AssetImage('assets/images/logo.png'),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
