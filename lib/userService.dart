import 'dart:convert';

import 'package:http/http.dart' as http;

class Name {
  final String first;
  final String last;

  const Name({required this.first, required this.last});

  factory Name.fromJson(Map<String, dynamic> data) {
    return Name(first: data["first"], last: data["last"]);
  }
}

class User {
  final String name;
  final String email;
  final String picture;

  const User({required this.name, required this.email, required this.picture});

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
        email: data["email"],
        picture: data["picture"]["medium"],
        name: data['name']['first']);
  }
}

class UserService {
  Future<List<User>> userData() async {
    final response =
        await http.get(Uri.parse("https://randomuser.me/api?results=50"));
    if (response.statusCode != 200) {
      print("No data found");
    }
    final data = jsonDecode(response.body);

    List<User> user_list = [];

    for (final user in data["results"]) {
      user_list.add(User.fromJson(user));
    }
    return user_list;
  }
}
