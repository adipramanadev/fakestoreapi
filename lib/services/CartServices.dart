import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/model/CartModel.dart';

class CartServices {
  final String apiUrl = "https://fakestoreapi.com/carts";

  //fungsi untuk mengambil data cart
  Future<List<CartModel>> fetchCarts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => CartModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to Load carts');
    }
  }
}
