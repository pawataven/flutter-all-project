import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:quizzmak/Screens/leaderboard.dart';
import 'package:quizzmak/Screens/profile_screen.dart';
import 'package:quizzmak/Screens/quiz_category.dart';

class NavBarCrategorySelection extends StatefulWidget {
  final initalIndex;
  const NavBarCrategorySelection({super.key, this.initalIndex = 0});

  @override
  State<NavBarCrategorySelection> createState() =>
      _NavBarCrategorySelectionState();
}

class _NavBarCrategorySelectionState extends State<NavBarCrategorySelection> {
  final PageStorageBucket bucket = PageStorageBucket();
  final pages = [
    const QuizCategory(),
    const Leaderboard(),
    const ProfileScreen(),
  ];
  late int selectedIndex;
  @override
  void initState() {
    // TODO: implement initState
    selectedIndex = widget.initalIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: pages[selectedIndex]),

      backgroundColor: Color(0xFFF2F9FF),

      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color(0xFFF194C3),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/2.png',
              height: 60,
            ), // ปรับขนาดโลโก้ตามต้องการ
            SizedBox(width: 10),
            Text(
              'Quizmak',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFFF72585), // สีไอคอน & label เมื่อถูกเลือก
        unselectedItemColor: Color(
          0xFFF2F9FF, // สีไอคอน & label เมื่อไม่ได้เลือก
        ),

        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF4CC9FE), // สีพื้นหลัง navbar
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.category),
            label: "หมวดหมู่",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.chart),
            label: "คะเเนนอันดับ",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.profile),
            label: "โปรไฟล์",
          ),
        ],
      ),
    );
  }
}
