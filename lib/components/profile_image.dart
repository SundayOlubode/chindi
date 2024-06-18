import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String imagePath;
  static double size = 150;

  const ProfileImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ClipOval(
        child: Image(
          image: AssetImage(imagePath),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
