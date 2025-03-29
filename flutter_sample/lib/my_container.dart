import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Using Container',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:  Colors.amber[900],
          title: const Text('เเอปของนายภวัฒ'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              container1(),
              container2(),
            ],
          ),
        ),
        ),
      );
  }

  Widget container2() => Container(
    height: 200, width: 150,
    margin: const EdgeInsets.all(50),
    padding: const EdgeInsets.only(top: 50, left: 10),
    // color: Colors.purple.shade900,
    decoration: BoxDecoration(
      color: Colors.purple[900],
      border: Border.all(
        color: Colors.yellow,
        style: BorderStyle.solid,
        width: 10,
      ),
      shape: BoxShape.rectangle,
      borderRadius: const BorderRadius.all(Radius.elliptical(50, 50))
    ),
    child: const Text("L O V E 😘", style: TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    ),
  );

  Widget container1() => Container(
          color: Colors.black12,
          height: 300,
          width: 300,
          margin: const EdgeInsets.all(50),
          padding: const EdgeInsets.only(left: 0, top: 100),
          child: const Text("ฮัลโล๋เวลคัม" ,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 35,
          fontWeight: FontWeight.bold),
        ),
  );
}