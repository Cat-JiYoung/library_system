import 'package:booksystem/model/book_info.dart';
import 'package:booksystem/model/repository/bood_repository.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:get/get.dart';

class AddBookController extends GetxController {
  var bookList = <Book>[].obs;

  Future<void> readSlot() async {
    BookRepository _bookRepository = BookRepository();
    bookList.clear();
    _bookRepository.readAll().then((result) async {
      switch (result) {
        case 'success':
          bookList.addAll(_bookRepository.bookList);
          update();
          break;

        default:
          print(_bookRepository.bookList.isEmpty);
          Get.snackbar('알수없는 오류', '앱을 다시 실행해주세요.');
      }
    });
  }

  Future<void> insertSlot(Book book) async {
    BookRepository _bookRepository = BookRepository();
    bookList.add(book);
    _bookRepository.insertAll(bookList).then((result) async {
      switch (result) {
        case 'success':
          Get.snackbar('추가 완료!', '도서가 추가되었습니다.');
          break;
        default:
          Get.snackbar('추가 실패', '다시 시도해주세요.');
          break;
      }
    });
  }
}
