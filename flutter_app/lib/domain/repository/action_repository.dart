import 'package:flutter_app/domain/model/action.dart';

abstract class ActionRepository {
  Stream<Action> getAction();
}
