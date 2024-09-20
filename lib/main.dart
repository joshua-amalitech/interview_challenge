import "package:example_test/home_screen.dart";
import "package:flutter/material.dart";

import "home_controller.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final HomeController controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(
        controller: controller,
      ),
    );
  }
}
