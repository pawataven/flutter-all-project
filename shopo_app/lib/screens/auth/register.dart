import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopo_app/root/root_colors.dart';
import 'package:shopo_app/screens/auth/auth_provider.dart';
import 'package:shopo_app/widgets/app_name.dart';
import 'package:shopo_app/widgets/title_text.dart';
import 'package:shopo_app/widgets/subtitle_text.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/registerScreen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      final success = await Provider.of<AuthProvider>(
        context,
        listen: false,
      ).registerUser(_emailController.text, _passwordController.text);
      if (success) {
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: TitleTextWidget(label: "สมัครสมาชิก"),
              ),
              const SizedBox(height: 16.0),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(labelText: "อีเมล์"),
                      validator: (value) {
                        return value != null && value.isEmpty
                            ? "กรุณากรอกอีเมล์"
                            : null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "รหัสผ่าน"),
                      validator: (value) {
                        return value != null && value.length < 6
                            ? "รหัสผ่านต้องมีอย่างน้อย 6 ตัว"
                            : null;
                      },
                    ),
                    const SizedBox(height: 32.0),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: root_colors.light1, // กำหนดสีของปุ่ม
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30,
                          ), // กำหนดมุมโค้งของปุ่ม
                        ),
                        minimumSize: Size(
                          double.infinity,
                          50,
                        ), // กำหนดความกว้างของปุ่มให้เต็มพื้นที่
                      ),
                      onPressed: _register,
                      icon: const Icon(
                        Icons.person_add, // ใส่ไอคอนที่ต้องการ
                        color: Colors.white, // กำหนดสีของไอคอน
                      ),
                      label: const Text(
                        "สมัครสมาชิก", // ข้อความในปุ่ม
                        style: TextStyle(
                          color: Colors.white, // กำหนดสีข้อความ
                          fontWeight: FontWeight.bold,
                          fontSize: 20, // ขนาดตัวอักษร
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SubtitleTextWidget(label: "มีบัญชีอยู่แล้ว?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const SubtitleTextWidget(
                            label: "เข้าสู่ระบบ",
                            color: Colors.orange,
                            fontSize: 16,
                            textDecoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
