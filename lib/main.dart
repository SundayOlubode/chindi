import 'package:chindi/providers/user_provider.dart';
import 'package:chindi/routes/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:chindi/routes/auth/sign_in.dart';
import 'package:chindi/utils/theme/theme.dart';
import 'package:chindi/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Chindi',
        themeMode: ThemeMode.system,
        theme: ChindiAppTheme.lightTheme,
        darkTheme: ChindiAppTheme.darkTheme,
        home: Consumer<UserProvider>(
          builder: (BuildContext context, UserProvider userProvider, _) {
            if (userProvider.user == null) {
              return const SignIn();
            } else {
              return const Home();
            }
          },
        ),
      ),
    );
  }
}
