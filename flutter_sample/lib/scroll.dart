import 'package:flutter/material.dart';

class MyScrliView extends StatelessWidget {
  const MyScrliView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScroliView'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Row(
            children: [
              boxContainer('One'),
              boxContainer('Two'),
              boxContainer('Three'),
              boxContainer('Four'),
              boxContainer('Five'),
              boxContainer('Six'),
              boxContainer('Sevan'),
            ],
          ),
        ),
      ),
    );
  }
  Widget boxContainer(String txt) => Container(
    width: 100, height: 150, 
    color: Colors.cyan.shade300, 
    margin: const EdgeInsets.all(20), 
    alignment: Alignment.center,
    child: Text(txt, style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

  );
}