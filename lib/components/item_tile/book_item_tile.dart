import 'package:app/models/item/booklist.dart';
import 'package:flutter/material.dart';

class MyBookTile extends StatelessWidget {
  final Book book;
  final void Function()? onTap;
  const MyBookTile({
    super.key,
    required this.book,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 15.0,
          ),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    book.bookImagePath,
                    height: 120,
                  ),
                  Text(
                    book.bookName,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
