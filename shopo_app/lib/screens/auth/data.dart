// users.dart
class User {
  final String email;
  final String password;

  User({required this.email, required this.password});
}

List<User> users = [
  User(email: 'admin@.com', password: 'password123'),
  User(email: 'user@example.com', password: 'password456'),
  // เพิ่มผู้ใช้ที่ต้องการ
];