import 'package:chat_app_mk/auth/login_or_register.dart';
import 'package:chat_app_mk/firebase_options.dart';
import 'package:chat_app_mk/theme/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatApp',
      theme: lightMode,
      darkTheme: lightMode,
      home: LoginOrRegister(),
    );
  }
}
