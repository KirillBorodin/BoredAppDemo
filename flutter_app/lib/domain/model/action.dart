import 'package:flutter_app/data/remote/model/action_response.dart';

class Action {
  final String id;
  final String result;

  const Action({
    required this.id,
    required this.result,
  });

  factory Action.fromResponse(ActionResponse response) => Action(
        id: response.id,
        result: response.result,
      );
}
