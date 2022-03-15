import 'package:booksystem/model/book_info.dart';
import 'package:booksystem/view/button.dart';
import 'package:booksystem/view/input_field.dart';
import 'package:booksystem/view/show_book_list.dart';
import 'package:booksystem/view_model/add_book_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AddBookController _taskController = Get.put(AddBookController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '도서 추가',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              InputField(title: "책이름", controller: _titleController),
              InputField(title: "저자명", controller: _authorController),
              InputField(title: "출판일", controller: _dateController),
              const SizedBox(height: 10),
              MyButton(
                text: "추가하기",
                onTap: () {
                  _taskController.insertSlot(Book(
                      title: _titleController.text,
                      author: _authorController.text,
                      date: _dateController.text));
                },
              ),
              const SizedBox(height: 30),
              MyButton(
                text: "모든 도서 보기",
                onTap: () async {
                  await Get.to(() => const ShowBookList());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // _addBook() async {
  //   Future<void> value = _taskController.insertSlot(Book(
  //       title: _titleController.text,
  //       author: _authorController.text,
  //       date: _dateController.text));
  //   print('추가 탭 누름');
  // }

  // _addBookList() async {
  //   int val = await _taskController.addBook(
  //       book: Book(
  //           id: -1,
  //           title: _titleController.text,
  //           author: _authorController.text,
  //           date: _dateController.text));
  //   print('id: $val');
  // }
}
