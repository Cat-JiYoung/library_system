import 'package:booksystem/model/book_info.dart';
import 'package:booksystem/view_model/book_db.dart';
import 'package:get/get.dart';

class AddBookController extends GetxController {
  var bookList = <Book>[].obs;

  Future<int> addBook({Book? book}) async {
    return await BookDB().insert(book);
  }

  // void readBook() async {
  //   List<Map<String, dynamic>> books = await BookDB.query();
  //   bookList.assignAll(books.map((data) => Book.fromMap(data)).toList());
  // }

  // void delete(Book book) {
  //   BookDB.delete(book);
  // }
}
