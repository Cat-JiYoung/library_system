import 'package:booksystem/model/book_info.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BookDB {
  // static Database? _db;
  static final String tableName = "books";

  // static Future<void> initDB() async {
  //   if (_db != null) {
  //     return;
  //   }
  //   try {
  //     String _path = await getDatabasesPath() + 'books.db';
  //     _db = await openDatabase(
  //       _path,
  //       version: version,
  //       onCreate: (db, version) {
  //         print("create");
  //         return db.execute(
  //           "CREATE TABLE $tableName ("
  //           "id INTEGER PRIMARY KEY AUTOINCREMENT, "
  //           "title STRING, author STRING, "
  //           "date STRING) ",
  //         );
  //       },
  //     );
  //   } catch (e) {
  //     print(e);
  //   };
  // }

  var _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = openDatabase(
      join(await getDatabasesPath(), 'books.db'),
      onCreate: (db, version) => createTable(db),
      version: 1,
    );
    return _database;
  }

  void createTable(Database db) {
    db.execute(
      "CREATE TABLE $tableName ("
      "id INTEGER PRIMARY KEY AUTOINCREMENT, "
      "title STRING, author STRING, "
      "date STRING) ",
    );
  }

  insert(Book? book) async {
    final db = await database;
    var res = await db.insert(tableName, book!.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }

  Read(String text) async {
    final db = await database;
    var res = await db.query(tableName, where: 'id = ?', whereArgs: [text]);
    return Book.fromMap(res);
  }

  Future<List<Book>> ReadAll() async {
    final db = await database;
    var res = await db.query(tableName);
    try {
      List<Book> list =
          res.isNotEmpty ? res.map((i) => Book.fromMap(i)).toList() : [];
      return list;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // static Future<int> insert(Book? book) async {
  //   //삽입
  //   print("Repository insert");
  //   return await _db?.insert('books', book!.toMap()) ?? 22;
  //   //insert 잘되는지 테스트용으로 '22' 추가
  // }

  // static delete(Book book) async {
  //   //삭제(걍 테스트용)
  //   return await _db!.delete('books', where: 'id=?', whereArgs: [book.id]);
  // }

  // static Future<List<Map<String, dynamic>>> query() async {
  //   print("query function called");
  //   return await _db!.query('books');
  // }
}
