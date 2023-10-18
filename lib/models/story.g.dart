// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Story _$StoryFromJson(Map<String, dynamic> json) => Story(
      id: json['id'] as String,
      originalTitle: json['originalTitle'] as String,
      originalStory: json['originalStory'] as String,
      assistantResponse: json['assistantResponse'] as String,
    );

Map<String, dynamic> _$StoryToJson(Story instance) => <String, dynamic>{
      'id': instance.id,
      'originalTitle': instance.originalTitle,
      'originalStory': instance.originalStory,
      'assistantResponse': instance.assistantResponse,
    };
