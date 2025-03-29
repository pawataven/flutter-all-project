import 'dart:math';

import 'package:flutter/material.dart';

class Randomnumber extends StatefulWidget {
  const Randomnumber({super.key});

  @override
  State<Randomnumber> createState() => _RandomnumberState();
}

class _RandomnumberState extends State<Randomnumber> {
  var randomNum = Random(); //เรียกใช้ฟังชั่นสุ่มเลขข
  int ranNum = 0;
  String txtInput = '';
  String _number = '';
  final _ctrl = TextEditingController();
  int x = 0, y = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('โปรเเกรมสุ่มตัวเลข ภวัฒ 1130'),
          centerTitle: true,
          backgroundColor: Colors.amber,
          titleTextStyle: const TextStyle(
              color: Color.fromARGB(255, 0, 47, 255), fontSize: 22),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              container_textfield(),
              container_button(),
            ],
          ),
        ),
      ),
    );
  }

  Widget container_textfield() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextField(
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20,
        ),
        controller: _ctrl,
        onChanged: (text) => _number = _ctrl.value.text,
      ),
      Text(
        txtInput,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    ],
  );

  Widget container_button() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextButton(
          onPressed: () {
            checkNum();
          },
          child: const Text(
            'กดส่งคำตอบ',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              backgroundColor: Colors.orangeAccent,
            ),
          )),
      TextButton(
          onPressed: () {
            setState(() {
              Randomnumber();
              txtInput = "ใส่ตัวเลข 1-9 เพื่อคาดเดา";
            });
          },
          child: const Text(
            "เริ่มต้นใหม่",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              backgroundColor: Colors.redAccent,
            ),
          ))
    ],
  );

  void checkNum() {
    txtInput = 'เดาตัวเลข 1 - 9';

    var ans = int.parse(_number);

    x = ans;

    if (ranNum == ans) {
      setState(() {
        txtInput = "คาดเดาถูกต้อง!";
      });
    } else if (ans > 9) {
      setState(() {
        txtInput = "กรุณาใส่เลข 1-9 เท่านั้น!!";
        return;
      });
    } else {
      setState(() {
        txtInput = "คุณเดาผิด!!! คำตอบที่ถูกคือ $ranNum";
      });
    }
  }

  void Randomnumber() {
    ranNum = randomNum.nextInt(9) + 1;
  }
}
