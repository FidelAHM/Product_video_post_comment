import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gift_shop/features/posts/Data_source/Model/post_model.dart';
import 'package:http/http.dart' as http;



class PostAPI{

   String? baseUrl = dotenv.env['BASE_URL'];

  Future<List> listPosts() async {
    final url = '$baseUrl/posts';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final List result = (jsonResponse)['posts'] as List;
      print('______success');
      return result.map((e) => PostModel.fromJson(e)).toList();
    } else {
      print(response.body);
      print(response.reasonPhrase);

      throw Exception(response.reasonPhrase);
    }
  }

}