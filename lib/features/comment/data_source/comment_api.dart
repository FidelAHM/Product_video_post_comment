import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gift_shop/features/comment/data_source/Model/comment_model.dart';
import 'package:http/http.dart' as http;



class CommentAPI{
  
  String? baseUrl = dotenv.env['BASE_URL'];
  Future<List> listComments() async {
    final url = '$baseUrl/comments';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final List result = (jsonResponse)['comments'] as List;
      print('______success');
      return result.map((e) => CommentModel.fromJson(e)).toList();
    } else {
      print(response.body);
      print(response.reasonPhrase);

      throw Exception(response.reasonPhrase);
    }
  }

}