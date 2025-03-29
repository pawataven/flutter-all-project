import 'package:callback_inherit_app/level2.dart';
import 'package:callback_inherit_app/level3.dart';
import 'package:flutter/material.dart';

class level1 extends StatefulWidget {
  const level1({super.key});

  @override
  State<level1> createState() => _level1State();
}

class _level1State extends State<level1> {
  int _counter = 0; //private ตัวเเปล

  void updateCounter(int newCounter) { // กำหนด Callback Function
    setState(() {
      _counter = newCounter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_counter.toString()),
          level2(counter: _counter, updateCounter: updateCounter),
          level3(counter: _counter, updateCounter: updateCounter),
        ],
      ),
    );
  }
}
