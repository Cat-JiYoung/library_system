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
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () {
          return ListView.builder(
              itemCount: _listController.bookList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 100,
                  height: 50,
                  color: Colors.green,
                  child: Text(
                    _listController.bookList[index].title.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              });
        },
      ),
    );
  }
}
