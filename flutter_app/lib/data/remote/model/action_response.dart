import 'package:json_annotation/json_annotation.dart';

part 'action_response.g.dart';


@JsonSerializable()
class ActionResponse {
  @JsonKey(name: 'key')
  final String id;
  @JsonKey(name: 'activity')
  final String result;

  const ActionResponse({
    required this.id,
    required this.result,
  });

  factory ActionResponse.fromJson(Map<String, dynamic> json) =>
      _$ActionResponseFromJson(json);
}
