import 'package:flutter/material.dart';

class fluttersample extends StatelessWidget {
  const fluttersample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Container",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              children: [
                container1(),
                container2(),
                container3(),
              ],
            ),
          )),
    );
  }

  Widget container1() => Container(
        height: 150,
        width: 300,
        color: Colors.amber,
        alignment: Alignment.center,
        child: const Text("No Decoration",
            style: TextStyle(color: Colors.white, fontSize: 22)),
      );
  Widget container2() => Container(
        margin: const EdgeInsets.all(20),
        height: 150,
        width: 300,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 85, 0),
          borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
        ),
        alignment: Alignment.center,
        child: const Text("Circular 30",
            style: TextStyle(color: Colors.white, fontSize: 22)),
      );

  Widget container3() => Container(
        height: 150,
        width: 300,
        decoration: const BoxDecoration(
          color: Colors.amber,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: const Text("Circle",
            style: TextStyle(color: Colors.white, fontSize: 22)),
      );
}
