import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gift_shop/features/Products/Datasource/models/products_model.dart';

import 'package:http/http.dart' as http;

class ProductsRepository {
  String? baseUrl = dotenv.env['BASE_URL'];

  Future<List> listProducts() async {
    final url = '$baseUrl/products';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final List result = (jsonResponse)['products'] as List;
      print('______success');
      return result.map((e) => ProductsModel.fromJson(e)).toList();
    } else {
      print(response.body);
      print(response.reasonPhrase);

      throw Exception(response.reasonPhrase);
    }
  }
}
