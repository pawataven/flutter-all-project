import 'package:flutter/material.dart';
import 'package:quizzmak/Screens/nav_bar_crategory_selection.dart';
import 'package:quizzmak/Screens/signup_screen.dart';
import 'package:quizzmak/Service/auth_service.dart';
import 'package:quizzmak/Widgets/my_button.dart';
import 'package:quizzmak/Widgets/snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
    //ใช้ตัวแปรนี้เพื่อจัดการสถานะรอโหลด
  bool isLoading = false;
  //ตัวเเปนควบคุมปุ่มซ่อนรหัสผ่าน
  bool isPasswordHidden = true;
  
  final AuthService _authService = AuthService(); //อ้างอิง class AuthService()

  // ฟังก์ชั่นสมัครสมาชิก
  void _login() async {
    setState(() {
      isLoading = true; //กำหนดให้รอโหลด
    });

    // เรียกใช้ _authService จากใน class AuthService()
    final result = await _authService.loginUser(
      //รับข้อมูลจาก textfield เเล้ว ไปเก็บที่ signUpUser ใน หน้า AuthService()
      email: emailController.text,
      password: passwordController.text,
    );
    //เช็คเงื่อนไขการดำเนินการ
    if (result == "ดำเนินการเสร็จสิ้น") {
      setState(() {
        isLoading = false;
      });
      // ถ้าเช้คว่าสมัครสมาชิกสำเร็จ จะเเสดงข้อความเเละ ส่งผุ้ใช้ไปหน้าเข้าสู่ระบบ
      Navigator.of(context).pushReplacement( //เเทนที่หน้าตอนนี้
        MaterialPageRoute(
          builder: (context) => const NavBarCrategorySelection(),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, "เข้าสู่ระบบไม่สำเร็จ $result"); //เเละมีการนำค่าความผิดพลาดมาเเสดงจากใน AuthService()
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F9FF),
      body: SafeArea(
        //วิดเจ็ตที่ช่วยป้องกัน UI ไม่ให้ซ้อนทับ
        child: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/loginlogo.png'), //รูปล้อคอิน
                SizedBox(height: 10),
            
                // textfield อีเมล์
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "กรอกอีเมล์",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
            
                //textfield รหัสผ่าน
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "กรอกรหัสผ่าน",
                    border: OutlineInputBorder(),
            
                    suffixIcon: IconButton(
                      //ไอคอนปุ่มซ่อนรหัสผ่าน
                      onPressed: () {
                        setState(() {
                          isPasswordHidden =! isPasswordHidden; // สลับค่าเปิดปิด flase เป็น true รหัสจะเสดงรหัสผ่าน
                        });
                      },
                      icon: Icon(isPasswordHidden ? Icons.visibility_off : Icons.visibility), //ถ้า isPasswordHidden เป็นค่า true จะเป็นไอคอนเปิดตา
                    ),
                  ),
                  obscureText: isPasswordHidden, //ฟังชั่น ซ่อนตัวอักษร
                ),
                SizedBox(height: 20),
            
                isLoading ? Center(
                  child: CircularProgressIndicator(),
                  )
                : 
                SizedBox(
                  width: double.infinity, //ให้ปุ่มเต็มจอ
                  child: MyButton(onTap: _login, buttontext: "เข้าสู่ระบบ"), //เรียกใช้ฟังชั่น _login ในการทำงาน
                ),
            
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.end, //จัดให้อยุ่ด้านขวาของหน้าจอ
                  children: [
                    Text(
                      "เพิ่งเคยเข้ามาใน Quizzmak ใช่หรือไม่? ",
                      style: TextStyle(fontSize: 16),
                    ),
                    GestureDetector(
                      //เป็นวิดเจ็ตใน Flutter ที่ใช้จับการสัมผัส ก็คือการ เเตะหน้าจอของผู้ใช้งาน
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignupScreen()),
                        );
                      },
                      child: Text(
                        "สมัครเลย",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF1493),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFFFF1493), // เพิ่มเส้นใต้,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
