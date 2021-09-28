import 'package:flutter_app/data/local/entity/action_entity.dart';

class Action {
  final String id;
  final String result;

  const Action({
    required this.id,
    required this.result,
  });

  factory Action.fromEntity(ActionEntity entity) => Action(
        id: entity.id,
        result: entity.result,
      );
}
