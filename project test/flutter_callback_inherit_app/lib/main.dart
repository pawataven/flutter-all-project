import 'package:flutter/material.dart';
import 'package:flutter_callback_inherit_app/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home:  Level1()
      home: HomePage(),
    );
  }
}
