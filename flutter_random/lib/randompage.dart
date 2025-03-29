import 'dart:math';

import 'package:flutter/material.dart';

class RandomPage extends StatefulWidget {
  const RandomPage({super.key});

  @override
  State<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  var rnd = Random(); 
  num r = 0;
  
  @override
  Widget build(BuildContext context) =>
    Scaffold(
      appBar:  AppBar(title: const Text('Random Number'),),
      body:  Center(
        child: Column(children: [
          const SizedBox(height: 15),
          Text(r.toString()),
          const SizedBox(height: 20),
          TextButton(
            onPressed: (){
              setState(() {
                 r = rnd.nextInt(100);
              });
            }, 
            child: const Text('Random Number')),
        ],),
      ),
    );
}