import 'dart:math';

import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  int num;
  String text;
  bool boolean;
  var rnd = Random();
  Page3({super.key, required this.num ,required this.text,required this.boolean});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
      title: const Text('Navigation'),
      centerTitle: true,
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.deepPurple,
    ),
    body: Center(
      child: Column(
        children: [
          const SizedBox(height:30 ,),
          Text('P A G E 3\nNume : $num\nText : $text\nBoolean : $boolean'),
          const SizedBox(height: 60,),
          btnBack(context)
          
        ],
      ),
    ),
    );
  }
    Widget btnBack(BuildContext ctx) => TextButton(
    onPressed: () => Navigator.pop(ctx, rnd.nextInt(100) ), 
    child:const Text('<< Back'));

}