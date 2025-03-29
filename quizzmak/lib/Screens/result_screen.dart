import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quizzmak/Screens/nav_bar_crategory_selection.dart';
import 'package:quizzmak/Widgets/my_button.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestion;

  const ResultScreen({
    super.key,
    required this.score, //เก็บคะเเนน
    required this.totalQuestion, //เก็บคำถามทั้งหมด
  });

  // ผลลัพคะเเนน
  Future<void> updateUserScore() async {
    User? user = FirebaseAuth.instance.currentUser; //ดึงข้อมูลผู้ใช้ จาก firebase
    if (user == null) return; //ถ้าผู้ใช้งานไม่ได้ล้อคอินจะไม่ทำงานฟังชั่นนี้
    try {
      DocumentReference userRef =
          FirebaseFirestore.instance.collection("userData").doc(user.uid); //เรียกใช้ข้อมูล ของ userData ใน firebase

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(userRef); //เพื่ออ่านข้อมูลจาก Firestore

        int existingScore = snapshot['score'] ?? 0; //ดึงคะแนนปัจจุบันจาก Firestore ถ้าไม่มีคะแนนจะใช้ค่าเริ่มต้นเป็น 0 ใน database
        transaction.update(userRef, {'score': existingScore + score}); //อัปเดตคะแนนของผู้ใช้ โดยการเพิ่มคะแนนใหม่ (score) เข้าไปในคะแนนเดิม (existingScore) 
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F9FF),
      appBar: AppBar(
      backgroundColor: Color(0xFFF194C3), toolbarHeight: 80,
        title: const Text("ผลลัพท์ของคุณ"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Stack(
                children: [
                  Lottie.network(
                    "https://lottie.host/b9aa275c-f01b-4fa1-9960-d9967ff18181/ZiMEqZ9vbD.json",
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Lottie.network(
                    "https://lottie.host/8d738e81-9792-4ef9-ae3e-753276be3a55/lntTULi0mQ.json",
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              const SizedBox(height: 100),
              const Text(
                "เสร็จสิ้น! ผลเป็นอย่างไรบ้าง 😂",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "เเต้มของคุณ $score ใน $totalQuestion คะเเนน",
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              // calculate the percentage
              Text(
                "ตอบถูกเฉลี่ย ${(score / totalQuestion * 100).toStringAsFixed(2)}%",
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: MyButton(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const NavBarCrategorySelection(),
                            ),
                            (route) => false,
                          );
                        },
                        buttontext: "กลับหน้าหลัก"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: MyButton(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const NavBarCrategorySelection(
                                initalIndex: 1,
                              ),
                            ),
                            (route) => false,
                          );
                        },
                        buttontext: "อันดับของคุณ"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
