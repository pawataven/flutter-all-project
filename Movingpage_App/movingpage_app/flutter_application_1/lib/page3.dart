import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
    Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Page3"),
      centerTitle: true,
      backgroundColor: Colors.green,
      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
    ),
    body: Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text("P a g e 3 "),
          const SizedBox(height: 80),
          //btnHome(context),
          const SizedBox(height: 20),
          btnBack(context)
        ],
      ),
    ),
  );
  
  Widget btnBack(BuildContext context)=> TextButton(
      onPressed: () => Navigator.pop(context,[123,"123"]), 
      child: const Text("<< Back"));
  
}