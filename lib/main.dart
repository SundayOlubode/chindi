import 'package:chindi_ke/routes/auth/forgot_password.dart';
import 'package:chindi_ke/routes/auth/login.dart';
import 'package:chindi_ke/routes/auth/reset_password.dart';
import 'package:chindi_ke/routes/auth/signin.dart';
import 'package:chindi_ke/routes/auth/signup.dart';
import 'package:chindi_ke/routes/list_new_task.dart';
import 'package:chindi_ke/routes/reg_unsuccesful.dart';
import 'package:chindi_ke/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:chindi_ke/routes/reg_succesful.dart';
import 'package:chindi_ke/routes/reg_unsuccesful.dart';
import 'package:chindi_ke/routes/profile/edit_profile.dart';
import 'routes/profile/user_profile.dart';
import 'package:chindi_ke/routes/notifications.dart';

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
      home: const Notifications(),
    );
  }
}
