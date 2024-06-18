import 'package:chindi_ke/routes/auth/login.dart';
import 'package:chindi_ke/routes/auth/reset_password.dart';
import 'package:chindi_ke/routes/auth/signup.dart';
import 'package:chindi_ke/utils/theme/theme.dart';
import 'package:flutter/material.dart';

import 'routes/profile/user_profile.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chindi',
      themeMode: ThemeMode.system,
      theme: ChindiAppTheme.lightTheme,
      darkTheme: ChindiAppTheme.darkTheme,
      home: const UserProfile(),
    );
  }
}
