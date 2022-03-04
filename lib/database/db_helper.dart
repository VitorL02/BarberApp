// ignore_for_file: unused_field, prefer_const_declarations, avoid_print

import 'package:barberapp/models/schedule.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database? _database;
  static final int _version = 1;
  static final String _tableName = "schedules"; // O nome da database

  static Future<void> initDb() async {
    if (_database != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'schedule.db';
      _database =
          await openDatabase(_path, version: _version, onCreate: (db, version) {
        print("Criando a base de dados");
        return db.execute(
          "CREATE TABLE $_tableName("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "name STRING, service STRING, date STRING,"
          "startTime STRING, endTime STRING,"
          "repeatSchedule STRING,"
          "color INTEGER,"
          "isCompleted INTEGER)",
        );
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Schedule? schedule) async {
    print("Dados Inseridos na base de dados");
    return await _database?.insert(_tableName, schedule!.toJson()) ?? 1;
  }
}
