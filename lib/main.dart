import 'package:cats_tinder/features/auth/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:cats_tinder/features/cats/cats_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Cats(),
    );
  }
}