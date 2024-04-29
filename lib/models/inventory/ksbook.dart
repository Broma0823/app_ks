import 'package:app/models/item/booklist.dart';
import 'package:flutter/material.dart';

class KSBook extends ChangeNotifier {
  final List<Book> _menu = [
    //Poloshirt
    Book(
      bookName: 'Blue PoloShirt',
      bookDescription: 'Blue PoloShirt by Koro Seraphim',
      bookImagePath: 'assets/images/BluePoloShirt.png',
      category: BookCategory.LIBRARY,
      maxnumberofItem: 25,
    ),
    Book(
      bookName: 'Barong',
      bookDescription: 'Blue PoloShirt by Koro Seraphim',
      bookImagePath: 'assets/images/Barong.png',
      category: BookCategory.LIBRARY,
      maxnumberofItem: 30,
    ),
    Book(
      bookName: 'Mint Green Poloshirt',
      bookDescription: 'Blue PoloShirt by Koro Seraphim',
      bookImagePath: 'assets/images/MintGreenPoloShirt.png',
      category: BookCategory.LIBRARY,
      maxnumberofItem: 40,
    ),
    Book(
      bookName: 'Two Tone Poloshirt',
      bookDescription: 'Blue PoloShirt by Koro Seraphim',
      bookImagePath: 'assets/images/TwoTonePoloShirt.png',
      category: BookCategory.LIBRARY,
      maxnumberofItem: 50,
    ),
    Book(
      bookName: 'Grey Trouser',
      bookDescription: 'Blue PoloShirt by Koro Seraphim',
      bookImagePath: 'assets/images/GrayTrouser.png',
      category: BookCategory.LIBRARY,
      maxnumberofItem: 60,
    ),
  ];

  //Getters
  List<Book> get menu => _menu;
}
