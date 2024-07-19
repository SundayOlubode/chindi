import 'package:chindi/routes/auth/sign_in.dart';
import 'package:chindi/utils/theme/theme.dart';
import 'package:flutter/material.dart';

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
      home: const SignIn(),
    );
  }
}
