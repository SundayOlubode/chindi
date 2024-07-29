import 'package:chindi/models/task.dart';
import 'package:chindi/providers/user_provider.dart';
import 'package:chindi/routes/auth/sign_in.dart';
import 'package:chindi/routes/home.dart';
import 'package:chindi/services/firebase_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    if (userProvider.user == null) {
      return const SignIn();
    } else {
      return MultiProvider(
        providers: [
          StreamProvider<List<Task>?>(
            create: (BuildContext context) => FirebaseFirestoreService().tasks,
            initialData: null,
          ),
        ],
        child: const Home(),
      );
    }
  }
}
