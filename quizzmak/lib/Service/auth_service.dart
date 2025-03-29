import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//หน้าฟังชั่นการทำงานของระบบล็อคอิน

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // for store the user data in firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
    Uint8List? profileImage,
  }) async {
    String res = "มีการเกิดข้อผิดพลาด";
    try {
      if (email.isNotEmpty && password.isNotEmpty && name.isNotEmpty) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        String? base65Image =
            profileImage != null ? base64Encode(profileImage) : null;
        // to store data in firestore
        await _firestore.collection("userData").doc(credential.user!.uid).set({
          'name': name,
          'uid': credential.user!.uid,
          'email': email,
          'score': 0,
          'photoBase64':base65Image,
        });
        res = 'ดำเนินการเสร็จสิ้น';
      } else {
        res = "โปรดกรอกข้อมูลให้ครบทุกช่องค่ะ";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  // for login user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "มีการเกิดข้อผิดพลาด";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = 'ดำเนินการเสร็จสิ้น';
      } else {
        res = "โปรดกรอกข้อมูลให้ครบทุกช่องค่ะ";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }
}

