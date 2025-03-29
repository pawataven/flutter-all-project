import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page'),),
      body: const Center(child: Column(children: [
       SizedBox(height: 10,),
       Text('Welcome to MyApp')
      ],),),
    );
    }
}