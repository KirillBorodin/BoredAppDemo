
import 'package:floor/floor.dart';
import 'package:flutter_app/data/remote/model/action_response.dart';

@Entity(tableName: 'action')
class ActionEntity {
  @primaryKey
  final String id;
  final String result;

  const ActionEntity({
    required this.id,
    required this.result,
  });

  factory ActionEntity.fromResponse(ActionResponse response) => ActionEntity(
    id: response.id,
    result: response.result,
  );
}