import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Database?db;

  Future<Database> Check() async {
    if (db != null) {
      return db!;
    }
    else {
      return await createDatabase();
    }
  }

  Future<Database> createDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String path = join(folder.path, "rnw.db");
    return openDatabase(path, version: 1, onCreate: (db, version) {
      String query =
          "CREATE TABLE std(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,notes TEXT)";
      db.execute(query);
    });
  }

  void insertData(String n1, String s1) async {
    db = await Check();
    db!.insert("std", {'name': n1, 'notes': s1});
  }

  Future<List<Map>> readData() async {
    db = await Check();
    String query = "SELECT * FROM std";
    List<Map> stdList = await db!.rawQuery(query, null);
    return stdList;
  }

  void deleteData(String id) async {
    db = await Check();
    db!.delete('std', where: 'id=?', whereArgs: [int.parse(id)]);
  }

  void updateData(String id, String n1, String s1) async {
    db = await Check();
    db!.update('std', {'name': n1, "notes": s1},
        where: 'id=?', whereArgs: [int.parse(id)]);
  }
}