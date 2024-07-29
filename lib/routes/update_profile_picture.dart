import 'package:chindi/components/profile_image.dart';
import 'package:chindi/providers/user_provider.dart';
import 'package:chindi/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateProfilePicture extends StatelessWidget {
  const UpdateProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    User user = userProvider.user!;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Update Profile Picture'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const ProfileImage(imagePath: 'assets/images/profile.png'),
          ],
        ));
  }
}
