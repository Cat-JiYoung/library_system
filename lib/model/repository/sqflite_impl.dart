import 'dart:developer';

import 'package:booksystem/view_model/sqflite_interface.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteImpl implements SqfliteInterface {
  static const int _currentVersion = 1;

  late Database _database;

  Future<Database> _init() async {
    return openDatabase(
      join(await getDatabasesPath(), 'books.db'),
      version: _currentVersion,
      onOpen: (db) => log('Database Open'),
      onCreate: (db, version) {
        log('Create Database');
        db.execute(
          'CREATE TABLE IF NOT EXISTS books(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, author TEXT, date TEXT)',
        );
      },
    );
  }

  Future<String> setDB() async {
    try {
      _database = await _init();
    } catch (e) {
      return e.toString();
    }
    return 'success';
  }

  @override
  String toString() {
    return _database.toString();
  }

  @override
  Future read(String sql) async {
    final List list = await _database.rawQuery(sql);
    return list;
  }

  @override
  Future<int> delete(String sql, List arguments) async {
    final int count = await _database.rawDelete(sql, arguments);
    return count;
  }

  @override
  Future<int> insert(String sql, List arguments) async {
    final int id = await _database.rawInsert(sql, arguments);
    return id;
  }

  @override
  Future<int> update(String sql, List arguments) async {
    final int count = await _database.rawUpdate(sql, arguments);
    return count;
  }
}
