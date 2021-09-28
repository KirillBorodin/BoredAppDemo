import 'package:flutter_app/app/locator.dart';
import 'package:flutter_app/data/remote/bored_api.dart';
import 'package:flutter_app/domain/model/action.dart';
import 'package:flutter_app/domain/repository/action_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ActionRepository)
class ActionRepositoryImpl implements ActionRepository {
  final BoredApi _remote = locator<BoredApi>();

  @override
  Stream<Action> getAction() async* {
    yield Action.fromResponse(await _remote.fetchAction());
  }
}
