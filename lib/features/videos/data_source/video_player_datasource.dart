import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:gift_shop/features/videos/data_source/Model/video_player_model.dart';
import 'package:gift_shop/features/videos/presentation/pages/video_detail.dart';

import 'package:http/http.dart' as http;

class VideoPlayerRepository {
  String? baseUrl = dotenv.env['BASE_URL_VIDEO'];

  Future<List> listVideos() async {
    final url = '$baseUrl/api/videos/';
    final uri = Uri.parse(url);
    final response = await http
        .get(uri, headers: {'x-apikey-header': 'api-access-key-5544'});
    final jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final List result = (jsonResponse)['data'] as List;
      print('______success');
      return result.map((e) => VideoPlayerModel.fromJson(e)).toList();
    } else {
      print(response.body);
      print(response.reasonPhrase);

      throw Exception(response.reasonPhrase);
    }
  }

  Future VideoDetail() async {
    final url = '$baseUrl/api/videos/66b2384932b2fde2a16346ce';
    final uri = Uri.parse(url);
    final response = await http
        .get(uri, headers: {'x-apikey-header': 'api-access-key-5544'});
    final jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final String result = (jsonResponse)['data']['videoUrl'];
      
      print('______success${result}');
      return result;
    } else {
      print(response.body);
      print(response.reasonPhrase);

      throw Exception(response.reasonPhrase);
    }
  }
}
