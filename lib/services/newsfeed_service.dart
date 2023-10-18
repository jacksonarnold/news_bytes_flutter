import '../utils/api_client.dart';
import '../utils/api_response.dart';

class NewsFeedService {
  final ApiClient _apiClient = ApiClient();

  // Future<ApiResponse> fetchNewsFeed() async {
  //   return await _apiClient.get('stories');
  // }

  Future<ApiResponse> fetchNewsFeed() async => await _apiClient.get('stories');
}
