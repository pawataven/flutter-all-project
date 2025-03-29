import 'package:bottom_navi_app/Product.dart';
import 'package:bottom_navi_app/help.dart';
import 'package:bottom_navi_app/home.dart';
import 'package:bottom_navi_app/member.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage()
  
    );
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _navItemIndex = 0; // ลำดับที่ของปุ่มที่เลือก
  var pages = <Widget> [const HomePage(),const Product(),const Member(),const Help()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title:const Text('BottomNavigationBar'),centerTitle: true,),
      body:  pages[_navItemIndex] ,
      
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,
        // backgroundColor: Colors.deepPurple,
        // fixedColor: const Color.fromARGB(255, 227, 205, 255),//สีปุ่มเมื่อถูกเลือก
        
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.black,

       
        showSelectedLabels: true,//แสดงข้อความบนปุ่มที่ถูกเลือก 
        showUnselectedLabels: true, //แสดงข้อความบนปุ่มที่ไม่ภูกเลือก
        currentIndex: _navItemIndex,
        items: btnNavItem(),
        onTap: (index) { // เมื่อคลิ๊กปุ่ม 
            setState(() {
              _navItemIndex = index;
            });
          },
        ),
        

    );
  
  }


  List<BottomNavigationBarItem> btnNavItem() {
    var iconItem = [Icons.home,Icons.shopping_cart,Icons.person,Icons.help];
    var labelItem = ['Home','Product','Member','Help'];
    var bgColorItem = [const Color.fromRGBO(233, 30, 99, 1),Colors.green,Colors.blue,Colors.red];

  List<BottomNavigationBarItem> mybtn; //กำหนดตัวแปรให้เป็นชนิด bottomNavigationBarItem

  BottomNavigationBarItem createItem(index){
      return BottomNavigationBarItem(
        icon: Icon(iconItem[index]),
        label: labelItem[index],
        backgroundColor: bgColorItem[index],

        );
    }

    mybtn = List.generate(iconItem.length,createItem);

    return mybtn; 
  }


}


