import 'package:flutter/material.dart';
import 'package:shopo_app/screens/auth/user_data.dart';

class AuthProvider with ChangeNotifier {
  // ฟังก์ชันการสมัครสมาชิก
  Future<bool> registerUser(String email, String password) async {
    // ตรวจสอบว่ามีผู้ใช้ที่มีอีเมลนี้อยู่แล้วหรือไม่
    bool userExists = UserData.users.any((user) => user.email == email);

    if (userExists) {
      return false; // หากมีผู้ใช้ที่มีอีเมลนี้แล้ว
    } else {
      // สร้างผู้ใช้ใหม่และเพิ่มในลิสต์
      UserData.users.add(User(email: email, password: password));
      return true;
    }
  }

  // ฟังก์ชันการล็อกอิน
  Future<bool> loginUser(String email, String password) async {
    // ตรวจสอบว่าอีเมลและรหัสผ่านตรงกับข้อมูลในลิสต์หรือไม่
    final user = UserData.users.firstWhere(
      (user) => user.email == email && user.password == password,
      orElse: () => User(email: '', password: ''),
    );

    return user.email.isNotEmpty;
  }
}