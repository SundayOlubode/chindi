import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chindi/providers/user_provider.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    Future<void> handleSignOut() async {
      userProvider.signOut();
    }

    return ElevatedButton(
      onPressed: handleSignOut,
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(
          Color.fromARGB(255, 255, 213, 210),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
      child: const Icon(
        Icons.logout,
        color: Color.fromARGB(255, 149, 10, 0),
      ),
    );
  }
}
