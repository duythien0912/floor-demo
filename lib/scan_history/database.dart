import 'dart:async';

import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'scan_history.dart';
import 'scan_history_dao.dart';

part 'database.g.dart';

@Database(version: 1, entities: [ScanHistory])
abstract class FlutterDatabase extends FloorDatabase {
  ScanHistoryDAO get scanHistoryDAO;
}
