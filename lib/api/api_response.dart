import 'package:news_bytes/models/story/story.dart';

class ApiResponse {
  final int status;
  final String message;
  final ApiData data;

  ApiResponse(
      {required this.status, required this.message, required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      message: json['message'],
      data: ApiData.fromJson(json['data']),
    );
  }
}

class ApiData {
  final List<Story> stories;

  ApiData({required this.stories});

  factory ApiData.fromJson(Map<String, dynamic> json) {
    var storiesFromJson = json['stories'] as List;
    List<Story> storyList =
        storiesFromJson.map((i) => Story.fromJson(i)).toList();

    return ApiData(
      stories: storyList,
    );
  }
}
