import 'package:flutter_app/data/local/bored_database.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DatabaseModule {
  @preResolve
  Future<BoredDatabase> get database =>
      $FloorBoredDatabase.databaseBuilder('bored_database.db').build();
}
