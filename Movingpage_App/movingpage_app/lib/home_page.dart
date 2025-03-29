import 'package:flutter/material.dart';
import 'package:movingpage_app/page2.dart';
import 'package:movingpage_app/page3.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
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
          const Text('Home Page'),
          const SizedBox(height: 60,),
          btnPage2(context),
          btnPage3(context)
        ],
      ),
    ),

  );
  Widget btnPage2(BuildContext ctx) => TextButton(
    onPressed: ()=> Navigator.push(
      ctx,
      MaterialPageRoute(builder: (ctx) =>  Page2(id: 662,)
      )).then((value) =>myAlert(ctx,'ข้อมูลที่ส่งกลับ : $value') ,)
  , child: const Text('Go To Page 2 >>')
  );
   Widget btnPage3(BuildContext ctx) => TextButton(
    onPressed: ()=> Navigator.push(
      ctx,
      MaterialPageRoute(builder: (ctx) =>  Page3(num: 55,text: 'AoT',boolean: false,)
      )).then((value) =>myAlert(ctx,'ข้อมูลที่ส่งกลับ : $value') ,)
  , child: const Text('Go To Page 3 >>')
  );
   void myAlert(BuildContext ctx, String msg){
    showDialog(
      context: ctx, 
      builder: (ctx) => AlertDialog(
        actions: [
          TextButton(
            onPressed: () =>Navigator.of(ctx).pop(), 
            child: const Text('Ok'))
        ],
        content: Text(msg) ,
      ) );
   }
}