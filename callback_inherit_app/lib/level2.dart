import 'dart:math';

import 'package:flutter/material.dart';

class level2 extends StatelessWidget {
  final counter;
  final updateCounter; //กำหนดตัวเเปร type Function

  const level2({super.key, required this.counter, required this.updateCounter});

  @override
  Widget build(BuildContext context) {
    int randCounter = Random().nextInt(8) + 1;
    return SizedBox(
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 119, 1),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {
              updateCounter(randCounter); // มาจาก function ของ levl 1
            },
            child: const Text(' SET '),
          ),
        ],
      ),
    );
  }
}
