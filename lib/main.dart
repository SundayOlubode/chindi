import 'package:chindi_ky/routes/login.dart';
import 'package:chindi_ky/routes/signup.dart';
import 'package:chindi_ky/routes/task_home.dart';
import 'package:chindi_ky/routes/task_menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final ThemeData _theme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: const Color.fromRGBO(56, 28, 114, 1),
      onPrimary: Colors.white,
      secondary: const Color.fromRGBO(51, 51, 51, 1),
      onSecondary: Colors.white,
      error: Colors.red.shade100,
      onError: Colors.red.shade400,
      surface: Colors.white,
      onSurface: Colors.grey.shade900,
    ),
    fontFamily: 'Poppins',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chindi',
      theme: _theme,
      home: SignUpScreen(),
    );
  }
}
