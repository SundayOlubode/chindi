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
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 10), // changes position of shadow
            ),
          ],
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
