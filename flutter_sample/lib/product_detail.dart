
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
     var id = args['id'];
    var price = args['price'];
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.deepOrange,
      ),
      body: ,
    );
  }

  Widget detail() => Container(
        alignment: Alignment.centerLeft,
        child: const Text(
            '📸 เก็บตกหลังจากเกมทีมชาติไทยพบกับกัมพูชากับการเกาะติด อัครพงศ์ พุ่มวิเศษ ที่เหมาคนเดียวสองประตูพร้อมกับเพื่อนซี้ข้างๆอย่าง อนันต์ ยอดสังวาลย์ แซวบอกให้เล่นกับกล้องหน่อย'),
      );

  Widget showprice(int id, int price) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Item no. $id'),
          Text('Price \$$price'),
        ],
      ),
      const Row(mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(Icons.add_shopping_cart, color: Colors.orangeAccent,size: 36,)
      ],
      )
      
    ],
  );

  Widget myDisplay(BuildContext ctx, int id, int price){
    return SingleChildScrollView(
      padding:const EdgeInsets.all(20),
      child: Column(
        children:  [

        ],
      ) ,
    );
  }

  Widget myContainer => Container(
    child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child:Image.network(
              'https://picsum.photos/id/${id*100}/300',
              fit: BoxFit.cover,
            ),
            ),

            const SizedBox(
              height: 15,
            ),
            detail(),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.deepOrange,
                ),
                onPressed: () {
                  Navigator.pop(
                    context,
                    '/',
                  );
                },
                child: const Text('<< Back'))
          ],
        ),
      ),
  );
}
