import 'package:flutter/material.dart';
import 'package:movingpage_app/page3.dart';

class Page2 extends StatelessWidget {
  int id;
   Page2({super.key , required this.id});

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
          Text('P A G E 2\nPage id : $id'),
          const SizedBox(height: 60,),
          btnPage3(context),
          btnBack(context)
        ],
      ),
    ),
    );
  }
  Widget btnPage3(BuildContext ctx) => TextButton(
    onPressed: ()=> Navigator.push(
      ctx,
      MaterialPageRoute(builder: (ctx) =>Page3(num: 20,text: 'ToA',boolean: true,))

    ).then((value) => myAlert(ctx, 'ค่าที่ส่งกลับคือ : $value')),
    
    child:const Text('Go TO Page 3'));
  Widget btnBack(BuildContext ctx) => TextButton(
    onPressed: () => Navigator.pop(ctx, [456, "four-five-six"]), 
    child:const Text('<< Back'));
  
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