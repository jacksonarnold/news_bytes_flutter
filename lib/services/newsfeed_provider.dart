import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/newsfeed_model.dart';
import '../utils/api_client.dart';
import '../utils/api_response.dart';

// Necessary for code-generation to work
part 'newsfeed_provider.g.dart';

final ApiClient _apiClient = ApiClient();

@riverpod
Future<NewsFeedModel> newsFeed(NewsFeedRef ref) async {
  ApiResponse response = await _apiClient.get('stories');
  NewsFeedModel model =
      NewsFeedModel(storyList: response.data.stories, storyImages: []);
  return model;
}
