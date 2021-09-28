// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionResponse _$ActionResponseFromJson(Map<String, dynamic> json) =>
    ActionResponse(
      id: json['key'] as String,
      result: json['activity'] as String,
    );

Map<String, dynamic> _$ActionResponseToJson(ActionResponse instance) =>
    <String, dynamic>{
      'key': instance.id,
      'activity': instance.result,
    };
