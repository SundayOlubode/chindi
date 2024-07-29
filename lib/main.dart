import 'package:chindi/models/task.dart';
import 'package:chindi/providers/user_provider.dart';
import 'package:chindi/services/firebase_firestore_service.dart';
import 'package:chindi/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
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
        Provider.value(
          value: FirebaseFirestoreService(),
        ),
      ],
      child: MaterialApp(
        title: 'Chindi',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: ChindiAppTheme.lightTheme,
        darkTheme: ChindiAppTheme.darkTheme,
        home: const Wrapper(),
      ),
    );
  }
}
