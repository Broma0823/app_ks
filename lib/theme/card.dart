import 'package:flutter/material.dart';

class TCardTheme {
  TCardTheme._();

  // ignore: prefer_const_constructors
  static CardTheme lightCardTheme = CardTheme(
    color: Colors.white,
  );
  static CardTheme darkCardTheme = const CardTheme(
    color: Color.fromARGB(223, 27, 29, 35),
  );
}
