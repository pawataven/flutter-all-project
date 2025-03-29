import 'package:flutter/material.dart';

class WyWidgetWork extends StatelessWidget {
  const WyWidgetWork({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("นายภวัฒ 1130"),
          centerTitle: true,
          backgroundColor: Colors.black54,
          titleTextStyle: const TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        body: Center(
          child: Column(
            children: [
              container1(),
              container2(),
              container3(),
            ],
          ),
        ),
      ),
    );
  }

  Widget container1() => Container(
        padding: const EdgeInsets.only(top: 2),
        child: Image.asset(
          "assets/tomyam.jpg",
          fit: BoxFit.scaleDown,
          width: 500,
        ),
      );

  Widget container2() => Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: const Column(
          children: [
            Text(
              'ต้มยำกุ้ง',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '..ต้มยำกุ้ง เมนูอาหารยอดฮิตประจำชาติไทย ด้วยรสชาติที่จัดจ้าน ทำให้เป็นที่ชอบใจของทั้งชาวไทยและชาวต่างชาติ อีกทั้งยังมีสรรพคุณของสมุนไพรมากมายหลากหลายชนิดในชามเดียว แต่ถ้าอยากให้รสชาติอร่อยมากขึ้นไปอีก ก็ต้องมี เครื่องปรุงรสอาหารคลีน อย่าง ซอสปรุงรสมาสเตอร์เชฟ ใช้เพียงแค่ขวดเดียว ไม่ต้องใส่เครื่องปรุงรสอย่างอื่นเพิ่ม ก็ได้รสชาติอร่อย ได้ประโยชน์ แถมยังได้สุขภาพที่ดีอีกด้วย.',
              style: TextStyle(),
            ),
          ],
        ),
      );

  Widget container3() => Container(
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  size: 18,
                  color: Color.fromARGB(255, 255, 175, 46),
                ),
                Icon(
                  Icons.star,
                  size: 18,
                  color: Color.fromARGB(255, 255, 175, 46),
                ),
                Icon(
                  Icons.star,
                  size: 18,
                  color: Color.fromARGB(255, 255, 175, 46),
                ),
                Icon(
                  Icons.star,
                  size: 18,
                  color: Color.fromARGB(255, 255, 175, 46),
                ),
                Icon(
                  Icons.star,
                  size: 18,
                  color: Color.fromARGB(255, 255, 175, 46),
                ),

                Row(
                  children: [
                    Text('    150K รีวิว',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(50)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.kitchen_outlined),
                    Text('PREP'),
                    Text('25นาที'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.time_to_leave_outlined),
                    Text('TIME'),
                    Text('2-3 นาที'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.time_to_leave_outlined),
                    Text('FEED'),
                    Text('4-6'),
                  ],
                
                ),
              ],
            )
          ],
        ),
      );
}