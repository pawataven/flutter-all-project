
import 'dart:convert';
import 'package:exam_api_1130/model/user.dart';
import 'package:exam_api_1130/model/user_name.dart';


class UserApi {
  static Future<List<User>> fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=50';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users =
        results.map((person) {
          final name = UserName(
            first: person['name']['first'],
            last: person['name']['last'],
          );
          return User(
            cell: person['cell'],
            gender: person['gender'],
            picture: person['picture']['thumbnail'],
            name: name,
          );
        }).toList();
    return users;
  }
}
