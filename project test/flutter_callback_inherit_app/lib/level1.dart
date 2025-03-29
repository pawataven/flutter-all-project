import 'package:flutter/material.dart';
import 'package:flutter_callback_inherit_app/level2.dart';

class Level1 extends StatefulWidget {
  const Level1({super.key});

  @override
  State<Level1> createState() => _Level1State();
}

class _Level1State extends State<Level1> {
  int _counter  = 0;

  void updateCounter(int newcounter ){
    setState(() {
      _counter = newcounter;

    });


  } 
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_counter.toString()),
          Level2(counter: _counter,updateCounter: updateCounter,)
          
        ],
      ),
    );
  }
}