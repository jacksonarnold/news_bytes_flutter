import 'package:json_annotation/json_annotation.dart';
part 'story.g.dart';

@JsonSerializable()
class Story {
  final String id;
  final String originalTitle;
  final String originalStory;
  final String assistantResponse;

  Story(
      {required this.id,
      required this.originalTitle,
      required this.originalStory,
      required this.assistantResponse});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$StoryToJson(this);

}
