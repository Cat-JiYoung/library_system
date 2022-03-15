class Book {
  int? id;
  late String title;
  late String author;
  late String date;

  Book(
      {this.id, required this.title, required this.author, required this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'date': date,
    };
  }

  Book.fromMap(dynamic obj) {
    id = obj['id'];
    title = obj['title'];
    author = obj['author'];
    date = obj['date'];
  }

  @override
  String toString() {
    return 'Book{id: $id, title: $title, author: $author, date: $date}';
  }
}
