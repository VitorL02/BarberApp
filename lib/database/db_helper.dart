// ignore_for_file: unused_field, prefer_const_declarations, avoid_print, unnecessary_string_interpolations, unused_local_variable

import 'package:barberapp/models/schedule.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DbHelper {
  static Database? db;
  static final int _version = 1;
  static final String _tableName = "schedules";

// O nome da database

  static Future initDb() async {
    sqfliteFfiInit();
    var dataBaseFactory = databaseFactoryFfi;
    if (db != null) {
      return;
    }
    try {
      var databasePath = getDatabasesPath();

      String path = await databasePath + 'schedules.db';

      print("Criando a base de dados");
      Database database = await openDatabase(path, version: _version,
          onCreate: (db, _version) async {
        await db.execute(
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
    return await db?.insert('$_tableName', schedule!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("Buscando dados no banco");
    return await db!.query("$_tableName");
  }
}
