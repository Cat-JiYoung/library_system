import 'package:booksystem/view_model/add_book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowBookList extends StatefulWidget {
  const ShowBookList({Key? key}) : super(key: key);

  @override
  State<ShowBookList> createState() => _ShowBookListState();
}

class _ShowBookListState extends State<ShowBookList> {
  final _listController = Get.put(AddBookController());

  @override
  Widget build(BuildContext context) {
    _listController.readSlot();
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () {
          return ListView.builder(
              itemCount: _listController.bookList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: 100,
                  height: 120,
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        'id: ${_listController.bookList[index].id.toString()}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '도서명: ${_listController.bookList[index].title.toString()}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '출판사명: ${_listController.bookList[index].author.toString()}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '출판날짜: ${_listController.bookList[index].date.toString()}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
