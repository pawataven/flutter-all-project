// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:quizzmak/Screens/login_screen.dart';
import 'package:quizzmak/Service/auth_service.dart';
import 'package:quizzmak/Widgets/my_button.dart';
import 'package:quizzmak/Widgets/snackbar.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  //ควบคุมและรับค่าจาก TextFormField
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //ใช้ตัวแปรนี้เพื่อจัดการสถานะรอโหลด
  bool isLoading = false;
  //ตัวเเปนควบคุมปุ่มซ่อนรหัสผ่าน
  bool isPasswordHidden = true;
  
  final AuthService _authService = AuthService(); //อ้างอิง class AuthService()

  // ฟังก์ชั่นสมัครสมาชิก
  void _signUp() async {
    setState(() {
      isLoading = true; //กำหนดให้รอโหลด
    });

    // เรียกใช้ _authService จากใน class AuthService()
    final result = await _authService.signUpUser(
      //รับข้อมูลจาก textfield เเล้ว ไปเก็บที่ signUpUser ใน หน้า AuthService()
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );
    //เช็คเงื่อนไขการดำเนินการ
    if (result == "ดำเนินการเสร็จสิ้น") {
      setState(() {
        isLoading = false;
      });
      // ถ้าเช้คว่าสมัครสมาชิกสำเร็จ จะเเสดงข้อความเเละ ส่งผุ้ใช้ไปหน้าเข้าสู่ระบบ
      showSnackBar(context, "สมัครสมาชิกสำเร็จ ระบบกำลังพาไปยังหน้าเข้าสู่ระบบ!");
      Navigator.of(context).pushReplacement( //เเทนที่หน้าตอนนี้
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, "สมัครสมาชิกไม่สำเร็จ $result"); //เเละมีการนำค่าความผิดพลาดมาเเสดงจากใน AuthService()
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F9FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/signuplogo.png"),
                const SizedBox(height: 10),
                // 
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "ชื่อผู้ใช้",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                // inpute field for email,
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "อีเมล์",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                // inpute field for password
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "รหัสผ่าน",
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden; // สลับค่าเปิดปิด flase เป็น true รหัสจะเสดงรหัสผ่าน
                        });
                      },
                      icon: Icon(
                        isPasswordHidden
                            ? Icons.visibility_off  //ถ้า isPasswordHidden เป็นค่า true จะเป็นไอคอนเปิดตา
                            : Icons.visibility,
                      ),
                    ),
                  ),
                  obscureText: isPasswordHidden, //ฟังชั่น ซ่อนตัวอักษร
                ),
                const SizedBox(height: 20),
                // for signup button
                isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox(
                        width: double.infinity, //ให้ปุ่มกว้างเต็มจอ
                        child: MyButton(onTap: _signUp, //เรียกใช้ฟังชั่น _signUp ในการทำงาน
                        buttontext: "สมัครสมาชิก"),
                      ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "หากคุณชื่อผู้ใช้งานอยู่เเล้ว 👉🏻 ",
                      style: TextStyle(fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "เข้าสู่ระบบ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF1493),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFFFF1493)
                        ),
                      ),
                    )
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
