import 'dart:convert';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:http/http.dart' as http;
import '../utils/config_dev.dart';
import '../models/api_response.dart';

class NewsFeedService {

  NewsFeedService();

  Future<String> fetchCognitoAuthSession() async {
    try {
      final cognitoPlugin = Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);
      final result = await cognitoPlugin.fetchAuthSession();
      final accessToken = result.userPoolTokensResult.value.accessToken;
      safePrint("User Access Token: $accessToken");

      return accessToken.toJson();
    } on AuthException catch (e) {
      safePrint('Error retrieving auth session: ${e.message}');
      throw Exception('Error retrieving auth session: ${e.message}');
    }
  }

  Future<ApiResponse> fetchNewsFeed() async {
    final String apiUrl = Config().apiUrl;
    final token = await fetchCognitoAuthSession();

    final response = await http.get(Uri.parse('$apiUrl/api/stories'), headers: <String, String>{
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return ApiResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load news feed');
    }
  }
}
