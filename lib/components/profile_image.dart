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
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: Image(
            image: AssetImage(imagePath),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
