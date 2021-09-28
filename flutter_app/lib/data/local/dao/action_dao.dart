import 'package:floor/floor.dart';
import 'package:flutter_app/data/local/entity/action_entity.dart';

@dao
abstract class ActionDao {
  @insert
  Future<void> insertAction(ActionEntity entity);

  @Query('SELECT * FROM action')
  Future<ActionEntity?> getAction();

  @Query('DELETE FROM action')
  Future<void> deleteAction();

  @transaction
  Future<void> update(ActionEntity entity) async {
    await deleteAction();
    await insertAction(entity);
  }
}
