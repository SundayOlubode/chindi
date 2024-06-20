import 'package:chindi_ke/routes/auth/forgot_password.dart';
import 'package:chindi_ke/routes/auth/login.dart';
import 'package:chindi_ke/routes/auth/reset_password.dart';
import 'package:chindi_ke/routes/auth/signin.dart';
import 'package:chindi_ke/routes/auth/signup.dart';
import 'package:chindi_ke/routes/chat.dart';
import 'package:chindi_ke/routes/home.dart';
import 'package:chindi_ke/routes/tasks/list_new_task.dart';
import 'package:chindi_ke/utils/theme/theme.dart';
import 'package:flutter/material.dart';

import 'routes/profile/user_profile.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chindi',
      themeMode: ThemeMode.system,
      theme: ChindiAppTheme.lightTheme,
      darkTheme: ChindiAppTheme.darkTheme,
      home: const Home(),
    );
  }
}
