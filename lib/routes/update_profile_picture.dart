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
    double size = 100;
    Widget avatar = user.avatarUrl.isEmpty
        ? CircleAvatar(
            radius: size,
            child: Icon(
              Icons.person_rounded,
              size: size,
            ),
          )
        : CircleAvatar(
            radius: size,
            backgroundImage: NetworkImage(user.avatarUrl),
          );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile Picture'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          avatar,
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextButton(
                onPressed: () {},
                label: "Take a picture",
              ),
              CustomTextButton(
                onPressed: () {},
                label: "Upload a picture",
              ),
              if (user.avatarUrl.isNotEmpty)
                CustomTextButton(
                  onPressed: () {},
                  label: "Remove picture",
                ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  const CustomTextButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed(),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
