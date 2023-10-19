// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Story _$StoryFromJson(Map<String, dynamic> json) => Story(
      id: json['id'] as String,
      originalTitle: json['original_title'] as String,
      originalStory: json['original_story'] as String,
      assistantResponse: json['assistant_response'] as String,
    );

Map<String, dynamic> _$StoryToJson(Story instance) => <String, dynamic>{
      'id': instance.id,
      'original_title': instance.originalTitle,
      'original_story': instance.originalStory,
      'assistant_response': instance.assistantResponse,
    };
