import 'package:flutter/material.dart';

class MemberLogin extends StatelessWidget {
  const MemberLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: const Text('Member Login'),),
      body: const Center(child: Column(children: [
       SizedBox(height: 10,),
       Text('Member Login Page'),
       
      ],),),
    );
  }
}