//ทำให้หน้ามันโชหลายๆหน้าเเบบซ้อนๆ

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:shopo_app/screens/cart/cart_screen.dart';
import 'package:shopo_app/screens/home_page.dart';
import 'package:shopo_app/screens/profile_screen.dart';
import 'package:shopo_app/screens/search_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late PageController? controller;
  int currentScreen = 0;

  List<Widget> screens = [
    const HomePage(),
    const SearchScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        physics:
            const NeverScrollableScrollPhysics(), //ทำให้ไม่ให้หน้าเเอพเลื่อนได้หลายหน้า
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentScreen,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        height: kBottomNavigationBarHeight, 
        elevation: 2,
        
        onDestinationSelected: (value) {
          setState(() {
            currentScreen = value;
          });

          controller?.jumpToPage(currentScreen);

        },
        
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(IconlyLight.home),
            icon: Icon(IconlyLight.home),
            label: "หน้าหลัก",
          ),
          NavigationDestination(
            selectedIcon: Icon(IconlyLight.search),
            icon: Icon(IconlyLight.search),
            label: "ค้นหา",
          ),
          NavigationDestination(
            selectedIcon: Icon(IconlyLight.bag),
            icon: Icon(IconlyLight.bag),
            label: "ตะกร้าของคุณ",
          ),
          NavigationDestination(
            selectedIcon: Icon(IconlyLight.profile),
            icon: Icon(IconlyLight.profile),
            label: "โปรไฟล์",
          ),
        ],
      ),
    );
  }
}
