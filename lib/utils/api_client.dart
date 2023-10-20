import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_response.dart';
import 'auth_util.dart';
import 'config_dev.dart';

class ApiClient {

  Future<ApiResponse> get(String path) async {
    final String apiUrl = Config().apiUrl;
    final token = await AuthUtil().fetchAuthToken();

    final response = await http
        .get(Uri.parse('$apiUrl/api/$path'), headers: <String, String>{
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return ApiResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data for path: $path');
    }
  }
}