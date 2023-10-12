import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/api_response.dart';

class NewsFeedService {
  final String apiUrl;

  NewsFeedService(this.apiUrl);

  Future<ApiResponse> fetchNewsFeed() async {
    final response = await http.get(Uri.parse('$apiUrl/news-feed'));

    if (response.statusCode == 200) {
      return ApiResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load news feed');
    }
  }
}
