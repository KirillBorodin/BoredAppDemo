import 'package:flutter_app/app/locator.dart';
import 'package:flutter_app/data/local/bored_database.dart';
import 'package:flutter_app/data/local/entity/action_entity.dart';
import 'package:flutter_app/data/remote/bored_api.dart';
import 'package:flutter_app/domain/model/action.dart';
import 'package:flutter_app/domain/repository/action_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ActionRepository)
class ActionRepositoryImpl implements ActionRepository {
  final BoredApi _remote = locator<BoredApi>();
  final BoredDatabase _local = locator<BoredDatabase>();

  @override
  Stream<Action> getAction() async* {
    var local = await _local.actionDao.getAction();
    if (local != null) {
      yield Action.fromEntity(local);
    }
    final response = await _remote.fetchAction();
    _local.actionDao.update(
      ActionEntity.fromResponse(response),
    );
    local = await _local.actionDao.getAction();
    if (local != null) {
      yield Action.fromEntity(local);
    }
  }
}
