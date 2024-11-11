import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/model/UserModel.dart';

class Userservice {
  //variabel url
  final String apiUrl = "https://fakestoreapi.com/users";

  //fungsi untuk mengambil data dari api
  Future<List<UserModel>> fetchUser() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
