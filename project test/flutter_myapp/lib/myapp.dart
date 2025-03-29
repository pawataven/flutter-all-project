import 'package:flutter/material.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // เอาแถบดิบัคออก
      // ส่วนของด้านบน home
      home: Scaffold(
        backgroundColor: Colors.blueGrey, // ใส่พื้นหลังแอป

        appBar: AppBar( backgroundColor: Colors.blue,title: const Text('แอปของฉัน', style: TextStyle(color: Colors.white ,fontSize: 24 )),),
      
      //ส่วนของเนื้อหา body 
        body: Container(
          alignment: Alignment.center,//ตรงกลาง 
        
          child: const Column(
            children: [
              Text('สวัสดีครับ',style: TextStyle(color: Color.fromARGB(255, 38, 17, 65), fontSize:  40)),
              Image(image: NetworkImage('https://pakmud.com/wp-content/uploads/2023/03/%E0%B8%A1%E0%B8%B5%E0%B8%A1%E0%B9%81%E0%B8%A1%E0%B8%A7-10.jpg')),
              Image(image: AssetImage('images/มีมแมว-10.jpg'))
            
            ],
          )    
        ),
      //
        floatingActionButton: FloatingActionButton(
        onPressed: (){}, //() ไม่มีชื่อ {} ไม่มีการทำงาน
        child: const Icon(Icons.thumbs_up_down_outlined),
      ),
      ),
      );


  }
}


