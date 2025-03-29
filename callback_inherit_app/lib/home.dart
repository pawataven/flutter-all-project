import 'package:callback_inherit_app/member.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLocked = false;
  var _icon = Icons.lock;
  var _text = 'กรุณาเข้าสู่ระบบด้วยค่ะ';
  
  bool getIslocked() => _isLocked;

// callback function
  void updateStatus(value) {
    setState(() {
      if (!value) {
        _icon = Icons.lock;
        _text = 'กรูณาเข้าสู่ระบบก่อนค่ะ';
      } else {
        _icon = Icons.lock_open;
        _text = 'ท่านได้เข้าสู่ระบบเรียบร้อยเเล้ว';
      }
      _isLocked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ) ,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Icon(_icon, size: 64,),
            Text(_text),
            const SizedBox(height: 60,),
            ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 119, 1),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {
              Navigator.push(context, 
                MaterialPageRoute(builder: (context) => MemberPage(updateStatus: updateStatus, getIslocked: getIslocked,)),
              );
            },
            child: const Text(' Member '),
          ),
          ],
        ),
      ),
    );
  }
}

