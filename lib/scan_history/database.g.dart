// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorFlutterDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FlutterDatabaseBuilder databaseBuilder(String name) =>
      _$FlutterDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FlutterDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$FlutterDatabaseBuilder(null);
}

class _$FlutterDatabaseBuilder {
  _$FlutterDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  /// Adds migrations to the builder.
  _$FlutterDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Creates the database and initializes it.
  Future<FlutterDatabase> build() async {
    final database = _$FlutterDatabase();
    database.database = await database.open(name ?? ':memory:', _migrations);
    return database;
  }
}

class _$FlutterDatabase extends FlutterDatabase {
  _$FlutterDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ScanHistoryDAO _scanHistoryDAOInstance;

  Future<sqflite.Database> open(String name, List<Migration> migrations) async {
    final path = join(await sqflite.getDatabasesPath(), name);

    return sqflite.openDatabase(
      path,
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onUpgrade: (database, startVersion, endVersion) async {
        MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);
      },
      onCreate: (database, _) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ScanHistory` (`id` REAL PRIMARY KEY AUTOINCREMENT, `time` REAL, `scanned_code` TEXT, `type` TEXT, `layoutInput` TEXT, `excel_transfer` TEXT, `server_transfer` TEXT)');
      },
    );
  }

  @override
  ScanHistoryDAO get scanHistoryDAO {
    return _scanHistoryDAOInstance ??=
        _$ScanHistoryDAO(database, changeListener);
  }
}

class _$ScanHistoryDAO extends ScanHistoryDAO {
  _$ScanHistoryDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _scanHistoryInsertionAdapter = InsertionAdapter(
            database,
            'ScanHistory',
            (ScanHistory item) => <String, dynamic>{
                  'id': item.id,
                  'time': item.time,
                  'scanned_code': item.scanned_code,
                  'type': item.type,
                  'layoutInput': item.layoutInput,
                  'excel_transfer': item.excel_transfer,
                  'server_transfer': item.server_transfer
                }),
        _scanHistoryUpdateAdapter = UpdateAdapter(
            database,
            'ScanHistory',
            'id',
            (ScanHistory item) => <String, dynamic>{
                  'id': item.id,
                  'time': item.time,
                  'scanned_code': item.scanned_code,
                  'type': item.type,
                  'layoutInput': item.layoutInput,
                  'excel_transfer': item.excel_transfer,
                  'server_transfer': item.server_transfer
                }),
        _scanHistoryDeletionAdapter = DeletionAdapter(
            database,
            'ScanHistory',
            'id',
            (ScanHistory item) => <String, dynamic>{
                  'id': item.id,
                  'time': item.time,
                  'scanned_code': item.scanned_code,
                  'type': item.type,
                  'layoutInput': item.layoutInput,
                  'excel_transfer': item.excel_transfer,
                  'server_transfer': item.server_transfer
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final _scanHistoryMapper = (Map<String, dynamic> row) => ScanHistory(
      row['id'] as double,
      row['time'] as String,
      row['scanned_code'] as String,
      row['type'] as String,
      row['layoutInput'] as String,
      row['excel_transfer'] as String);

  final InsertionAdapter<ScanHistory> _scanHistoryInsertionAdapter;

  final UpdateAdapter<ScanHistory> _scanHistoryUpdateAdapter;

  final DeletionAdapter<ScanHistory> _scanHistoryDeletionAdapter;

  @override
  Future<ScanHistory> updateSendtoServer(
      String status, String lyoutInput, double time) async {
    return _queryAdapter.query(
        'UPDATE ScanHistory set server_transfer = ? = ? WHERE time = ?',
        arguments: <dynamic>[status, lyoutInput, time],
        mapper: _scanHistoryMapper);
  }

  @override
  Future<void> updateSendtoExcel(String status, double time) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE ScanHistory set excel_transfer = ? WHERE time = ?',
        arguments: <dynamic>[status, time]);
  }

  @override
  Future<void> deleteOldTime(double time) async {
    await _queryAdapter.queryNoReturn('DELETE FROM ScanHistory where time < ?',
        arguments: <dynamic>[time]);
  }

  @override
  Future<List<ScanHistory>> findScanHistoryByType(String type) async {
    return _queryAdapter.queryList(
        'SELECT * FROM ScanHistory WHERE type = ? order by time desc',
        arguments: <dynamic>[type],
        mapper: _scanHistoryMapper);
  }

  @override
  Future<void> insertScanHistory(ScanHistory scanHistories) async {
    await _scanHistoryInsertionAdapter.insert(
        scanHistories, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> updateScanHistory(ScanHistory scanHistories) async {
    await _scanHistoryUpdateAdapter.update(
        scanHistories, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> deleteScanHistory(ScanHistory scanHistories) async {
    await _scanHistoryDeletionAdapter.delete(scanHistories);
  }
}
