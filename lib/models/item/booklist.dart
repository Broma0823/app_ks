class Book {
  final String bookName;
  final String bookDescription;
  final String bookImagePath;
  final BookCategory category;
  final int maxnumberofItem;

  Book({
    required this.bookName,
    required this.bookDescription,
    required this.bookImagePath,
    required this.category,
    required this.maxnumberofItem,
  });
}

enum BookCategory {
  LIBRARY,
}
