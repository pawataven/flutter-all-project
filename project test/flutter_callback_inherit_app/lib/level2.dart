import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_callback_inherit_app/level3.dart';

class Level2 extends StatelessWidget {
  final  int counter;
  final  Function updateCounter; //กำหนดให้ up......... เป้นชนิดฟังก์ชัน 
  
  const Level2({super.key,required this.counter , required this.updateCounter});

  @override
  Widget build(BuildContext context) {
    int ranCounter = Random().nextInt(8)+1;
    
    return SizedBox(child: Column(
      children: [
          ElevatedButton( style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,foregroundColor: Colors.white ,
            padding: const EdgeInsets.symmetric(horizontal: 20 ,vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            onPressed: (){
              updateCounter(ranCounter);

            },
            child: const Text(' Set Counter ')),
          const SizedBox(height: 60,),
          Level3(counter: counter, updateCounter: updateCounter)

    ],),);
  
  }
}