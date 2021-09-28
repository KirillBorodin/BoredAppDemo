// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bored_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorBoredDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$BoredDatabaseBuilder databaseBuilder(String name) =>
      _$BoredDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$BoredDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$BoredDatabaseBuilder(null);
}

class _$BoredDatabaseBuilder {
  _$BoredDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$BoredDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$BoredDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<BoredDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$BoredDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$BoredDatabase extends BoredDatabase {
  _$BoredDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ActionDao? _actionDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `action` (`id` TEXT NOT NULL, `result` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ActionDao get actionDao {
    return _actionDaoInstance ??= _$ActionDao(database, changeListener);
  }
}

class _$ActionDao extends ActionDao {
  _$ActionDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _actionEntityInsertionAdapter = InsertionAdapter(
            database,
            'action',
            (ActionEntity item) =>
                <String, Object?>{'id': item.id, 'result': item.result});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ActionEntity> _actionEntityInsertionAdapter;

  @override
  Future<ActionEntity?> getAction() async {
    return _queryAdapter.query('SELECT * FROM action',
        mapper: (Map<String, Object?> row) => ActionEntity(
            id: row['id'] as String, result: row['result'] as String));
  }

  @override
  Future<void> deleteAction() async {
    await _queryAdapter.queryNoReturn('DELETE FROM action');
  }

  @override
  Future<void> insertAction(ActionEntity entity) async {
    await _actionEntityInsertionAdapter.insert(
        entity, OnConflictStrategy.abort);
  }

  @override
  Future<void> update(ActionEntity entity) async {
    if (database is sqflite.Transaction) {
      await super.update(entity);
    } else {
      await (database as sqflite.Database)
          .transaction<void>((transaction) async {
        final transactionDatabase = _$BoredDatabase(changeListener)
          ..database = transaction;
        await transactionDatabase.actionDao.update(entity);
      });
    }
  }
}
