import 'dart:convert';

class ApiResponse {
  final int status;
  final String message;
  final ApiData data;

  ApiResponse({required this.status, required this.message, required this.data});

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
    List<Story> storyList = storiesFromJson.map((i) => Story.fromJson(i)).toList();

    return ApiData(
      stories: storyList,
    );
  }
}

class Story {
  final String id;
  final String originalTitle;
  final String originalStory;
  final String assistantResponse;

  Story({required this.id, required this.originalTitle, required this.originalStory, required this.assistantResponse});

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['id'],
      originalTitle: json['original_title'],
      originalStory: json['original_story'],
      assistantResponse: json['assistant_response'],
    );
  }
}

// Function to convert JSON string to ApiResponse object
ApiResponse apiResponseFromJson(String str) {
  final jsonData = json.decode(str);
  return ApiResponse.fromJson(jsonData);
}