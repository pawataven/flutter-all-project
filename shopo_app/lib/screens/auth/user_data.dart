// user_data.dart
class User {
  final String email;
  final String password;

  User({required this.email, required this.password});
}

class UserData {
  static List<User> users = [];
}