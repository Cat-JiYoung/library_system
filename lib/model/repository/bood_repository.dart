import 'package:booksystem/model/book_info.dart';
import 'package:booksystem/model/repository/sqflite_impl.dart';

class BookRepository with SqfliteImpl {
  static String table = 'books';
  List<Book> bookList = [];

  Future<String> readAll() async {
    try {
      await super.setDB();
    } catch (e) {
      return e.toString();
    }
    try {
      List<Map> list = await super.read('SELECT * FROM books');
      bookList = List.generate(
        list.length,
        (index) => Book(
          id: list[index]['id'],
          title: list[index]['title'],
          author: list[index]['author'],
          date: list[index]['date'],
        ),
      );
    } catch (e) {
      return e.toString();
    }
    return 'success';
  }

  Future<String> deleteAll() async {
    try {
      await super.setDB();
    } catch (e) {
      return e.toString();
    }
    try {
      await super.delete('DELETE FROM books', []);
    } catch (e) {
      return e.toString();
    }
    return 'success';
  }

  Future<String> insertAll(List list) async {
    try {
      await super.setDB();
    } catch (e) {
      return e.toString();
    }

    try {
      await deleteAll();
    } catch (e) {
      return e.toString();
    }

    try {
      for (Book element in list) {
        Map<String, dynamic> maps = element.toMap();
        await super.insert(
          'INSERT INTO books(title, author, date) VALUES(?, ?, ?)',
          [
            maps['title'],
            maps['author'],
            maps['date'],
          ],
        );
      }
    } catch (e) {
      return e.toString();
    }
    return 'success';
  }
}
