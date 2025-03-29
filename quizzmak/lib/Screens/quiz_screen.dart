import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizzmak/Screens/result_screen.dart';
import 'package:quizzmak/Widgets/my_button.dart';

class QuizScreen extends StatefulWidget {
  final String categoryName;
  const QuizScreen({super.key, required this.categoryName});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Map<String, dynamic>> questions = [];
  int currentIndex = 0, score = 0;
  int? selectedOption;
  bool hasAnswered = false, isLoading = true;
  @override
  void initState() {
    _fetchQuestions();
    super.initState();
  }

  //ดึงข้อมูลจาก firebase
  Future<void> _fetchQuestions() async {
    try {
      var snapshot =
          await FirebaseFirestore.instance //ดึงข้อมูลจาก firebase
              .collection("QuestionsTest")
              .doc(widget.categoryName)
              .get();

      if (snapshot.exists) { //ฟังชันตรวจสอบว่ามีข้อมูลมาหรือเปล่า
        var data = snapshot.data(); 
        //ตรวจสอบว่า data ไม่เป็น null และตรวจสอบว่ามีคีย์ "questions" อยู่ใน data หรือไม่
        if (data != null && data.containsKey("questions")) {
          //ถ้า data ไม่เป็น null และมีคีย์ "questions", ค่าของคีย์ "questions" จะถูกดึงออกมาและเก็บในตัวแปร questionMap
          var questionMap = data['questions'];

          //ตรวจสอบว่า questionMap เป็น Map หรือเปล่า
          if (questionMap is Map<String, dynamic>) {
            var fetchedQuestions =
                questionMap.entries.map((entry) { //ใช้ entries เพื่อดึงแต่ละรายการจาก questionMap
                
                  var q = entry.value;
                  //ดึงข้อมูลของตัวเลือก (options) จากคำถาม โดยคาดว่าในแต่ละคำถามจะมีคีย์ options ซึ่งเก็บตัวเลือกคำตอบ
                  var optionsMap = q['options'] as Map<String, dynamic>; 
                  var optionList = 
                  //เปลี่ยนข้อมูลตัวเลือกที่เป็น Map ไปเป็น List
                      optionsMap.entries.toList()..sort( 
                        (a, b) => int.parse(a.key).compareTo(int.parse(b.key)),
                      );
                  var options =
                      optionList.map((e) => e.value.toString()).toList();
                  return {
                    'questionText': q['questionText'] ?? "ไม่พบคำถาม", //'questionText': คำถามที่มาจาก q['questionText'] (ถ้าไม่มีจะขึ้นว่า ไม่พบคำถามในหน้าจอตรงกลาง).
                    'options': options,
                    'correctOptionKey':
                        int.tryParse(q['correctOptionKey'].toString()) ?? 0,
                  };
                }).toList(); //เปลี่ยนผลลัพธ์ทั้งหมดเป็น List 

            //สับเปลี่ยนและจำกัดคำถาม
            fetchedQuestions.shuffle(Random()); //สุ่มคำถามทุกครั้ง

            setState(() => questions = fetchedQuestions); //คือการเรียกใช้ฟังก์ชัน setState ใน Flutter เพื่อทำให้ UI ของแอปถูกอัพเดตเมื่อมีการเปลี่ยนแปลงข้อมูล
          }
        }
      }
    } catch (e) {
      print(e.toString()); //ดักจับข้อผิดพลาดเเล้วจะส่งออกมา
    } finally {
      setState(() {
        isLoading = false; //เพื่อหยุดการแสดงผลการโหลดข้อมูลใน UI 
      });
    }
  }

  //ตรวจเช็คคำตอบที่ถูก
  void _checkAnswer(int index) {
    setState(() {
      hasAnswered = true;
      selectedOption = index;

      if (questions[currentIndex]['correctOptionKey'] == index + 1) {
        score++;
      }
    });
  }

  //เพื่อคำถามข้อต่อไป
  Future<void> _nextQuestion() async {
    if (currentIndex < questions.length - 1) { //จะตรวจสอบว่าผู้ใช้ยังไม่ถึงคำถามสุดท้าย จะลบ1 ไปเรื่อยๆจนข้อสุดท้าย
      setState(() {
        currentIndex++; //เพิ่มคำถามเพื่อไปยังคำถามถัดไป
        hasAnswered = false; // รีเซ็ทสถานะการตอบคำถาม
        selectedOption = null; // รีเซ็ทตัวเลือกที่ถูกเลือก
      });
    } else {
      // ถ้าถึงคำถามสุดท้าย, อัพเดตคะแนนและไปยังหน้าผลลัพธ์
      await _updateUserScore();  // อัพเดตคะแนนผู้ใช้ในฐานข้อมูล
      Navigator.pushReplacement( 
        context,
        MaterialPageRoute(builder: (context) => ResultScreen(
            score: score, // ส่งคะแนนที่ได้
            totalQuestion: questions.length, // ส่งจำนวนคำถามทั้งหมด
          ),),
      );
    }
  }

  Future<void> _updateUserScore() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    try {
      var userRef = FirebaseFirestore.instance
          .collection("userData")
          .doc(user.uid);
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        var snapshot = await transaction.get(userRef);
        if (!snapshot.exists) return;
        int existingScore = snapshot['score'] ?? 0; //ถ้าผู้ใช้ไม่มีข้อมูลคะแนน  จะใช้ค่าเริ่มต้นเป็น 0 
        transaction.update(userRef, {'score': existingScore + score});  //เอาคะเเนนเก่ามารวมเป็นคะเเนนทั้งหมด
      });
    } catch (e) {
      debugPrint('error updating score $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: _buildAppBar(),
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if (questions.isEmpty) {
      return const Scaffold(body: Center(child: Text("ไม่พบคำถามในขณะนี้")));
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (currentIndex + 1) / questions.length,
              backgroundColor: Colors.grey.shade300,
              color: Color(0xFFF194C3),
              minHeight: 8,
            ),
            SizedBox(height: 50),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),

              //สำหรับคำถาม
              child: Text(
                questions[currentIndex]['questionText'],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF72585),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 50),

            //สำหรับส่วนช้อยคำตอบ
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return _buildOption(index);
                },
                separatorBuilder: (_, __) => SizedBox(height: 15),
                itemCount: questions[currentIndex]['options'].length,
              ),
            ),

            //เรนเดอร์ปุ่มเสร็จสิ้นถัดไปตามเงื่อนไข
            if (hasAnswered)
              MyButton(
                onTap: _nextQuestion,
                buttontext:
                    currentIndex == questions.length - 1
                        ? "ดูผลลัพท์"
                        : "ถัดไป",
              ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(int index) {
    bool isCorrect = questions[currentIndex]['correctOptionKey'] == index + 1;
    bool isSelected = selectedOption == index;
    Color bgColor =
        hasAnswered
            ? (isCorrect
                ? Colors.green.shade300
                : isSelected
                ? Colors.red.shade300
                : Colors.grey.shade200)
            : Colors.grey.shade200;

    Color textColor =
        hasAnswered && (isCorrect || isSelected) ? Colors.white : Colors.black;
    return InkWell(
      onTap: hasAnswered ? null : () => _checkAnswer(index),
      child: Container(
        width: MediaQuery.of(context).size.width + 0.8,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          questions[currentIndex]['options'][index],
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: textColor),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      foregroundColor: Color(0xFFF2F9FF),
      title: Text(
        "${widget.categoryName} {${currentIndex + 1}/${questions.length}}",
      ),
      centerTitle: true,
      backgroundColor: Color(0xFF4CC9FE),
    );
  }
}
