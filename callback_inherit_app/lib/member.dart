import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget {
  final updateStatus;
  final getIslocked;

  const MemberPage({super.key, this.updateStatus, this.getIslocked});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MEMBER Page'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            btnLoginLogout(context),
            const SizedBox(
              height: 30,
            ),
            btnBack(context),
          ],
        ),
      ),
    );
  }

  Widget btnLoginLogout(BuildContext ctx) {
    return OutlinedButton(
      style:
          OutlinedButton.styleFrom(side: const BorderSide(color: Colors.grey)),
      onPressed: () {
        //เมื่อคลิ๊กปุ่ม ให้สลับสถานะการเข้าระบบจาก true => false , false => true
        widget.updateStatus(!widget.getIslocked());
        setState(() {
          widget.getIslocked();
        });
      },
      child: Text(!widget.getIslocked()? 'เข้าสู่ระบบ' : 'ออกจากระบบ'),
    );
  }

  Widget btnBack(BuildContext ctx) {
    return TextButton(
        onPressed: () => Navigator.pop(ctx), 
        child: const Text(' << Back '));
  }
}
