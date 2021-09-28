import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_app/data/local/dao/action_dao.dart';
import 'package:flutter_app/data/local/entity/action_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'bored_database.g.dart';

@Database(
  version: 1,
  entities: [
    ActionEntity,
  ],
)
abstract class BoredDatabase extends FloorDatabase {
  @preResolve
  ActionDao get actionDao;
}
