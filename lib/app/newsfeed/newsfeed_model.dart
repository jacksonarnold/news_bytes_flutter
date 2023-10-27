import 'package:news_bytes/models/story/story.dart';

class NewsFeedModel {
  final List<Story> storyList;
  final List<String> storyImages;

  NewsFeedModel({required this.storyList, required this.storyImages});
}