import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class NotesDatabase {
  static final _dbname = "taskdatabase.db";
  static final _dbversion = 1;
  static final _tablename = "myTable";
  static final columntitle = "title";
  static final columnbool = "bool";
  static final columnid = "_id";
  NotesDatabase._privateConstructor();
  static final NotesDatabase instance = NotesDatabase._privateConstructor();
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbname);
    return await openDatabase(path, version: _dbversion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE $_tablename (
      $columnid INTEGER PRIMARY KEY,
      $columntitle TEXT NOT NULL,
      $columnbool BOOLEAN NOT NULL
      )
      ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tablename, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(_tablename);
  }

  Future Update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnid];
    return await db.update(_tablename, row,
        where: '$columnid=? $columntitle=? $columnid=?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(_tablename,
        where: '$columnid=? $columntitle=? $columnbool=?', whereArgs: [id]);
  }
}
