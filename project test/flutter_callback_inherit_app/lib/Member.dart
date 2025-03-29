import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget {
  final Function getisLocked; 
  final Function updatestatus;

  const MemberPage({super.key,required this.updatestatus,required this.getisLocked});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Member'),),
      body:Center(child: Column(children: [ 
        
        const SizedBox(height:60 ,),
        btnLoginLogout(context),
        const SizedBox(height:60 ,),
        btnBack(context),

       
      ],),)
    );

  }

 Widget btnLoginLogout(BuildContext ctx){
    return OutlinedButton(
        style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.green)),
        onPressed: (){
          //เมื่อคลิกปุ่ม ให้สลัลสถานะการเข้าระบบจาก true -> flase , flase -> true
          widget.updatestatus(!widget.getisLocked());
          setState(() {
            widget.getisLocked();
          });
        },
        child: Text((!widget.getisLocked()? 'เข้าสู่ระบบ' : 'ออกจากระบบ'))
      );
 }
 Widget btnBack(BuildContext ctx){
  return TextButton(
      onPressed:()=> Navigator.pop(context), 
      child: const Text('<<กลับ'));

 }

}