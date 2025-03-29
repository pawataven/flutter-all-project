import 'package:flutter/material.dart';

class level3 extends StatelessWidget {
  final int counter;
  final Function updateCounter;

  const level3({
    Key? key,
    required this.counter,
    required this.updateCounter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 119, 1),
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {
        updateCounter(0); // มาจาก function ของ levl 1
      },
      child: const Text(' Stop '),
    );
  }
}
