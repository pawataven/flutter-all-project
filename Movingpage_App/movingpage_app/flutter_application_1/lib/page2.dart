import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page3.dart';


class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Page2"),
      centerTitle: true,
      backgroundColor: Colors.green,
      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
    ),
    body: Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text("P A G E 2"),
          const SizedBox(height: 80),
          btnPage3(context),
          const SizedBox(height: 20),
          btnBack(context)
        ],
      ),
    ),
  );

  Widget btnPage3(BuildContext context) => TextButton(
    onPressed: () async{
      List<dynamic> values = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>const Page3()));
        // ignore: use_build_context_synchronously
      myAlert(context,"ข้อมูลที่ส่งกลับมาคือ ${values[0]},${values[1]}");
    },
    child: const Text("Go to Page3"));

  Widget btnBack(BuildContext context)=> TextButton(
    onPressed: () => Navigator.pop(context,Random().nextInt(100)), 
    child: const Text("<< Back"));

  void myAlert (BuildContext context,String message){
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
            onPressed: ()=>Navigator.of(context).pop(), 
            child: const Text("OK"))
        ],
        content: Text(message),
    ));
  } 
      
}