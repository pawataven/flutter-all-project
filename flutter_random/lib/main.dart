import 'package:flutter/material.dart';
// import 'package:flutter_random/randompage.dart';
// import 'package:flutter_random/second_page.dart';
import 'package:flutter_random/thrid_page.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Number Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ThridPage(),
    );
  }
}
