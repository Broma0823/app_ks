import 'package:flutter/material.dart';

class MyBorrowTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyBorrowTextField({
    super.key,
    this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: Theme.of(context).splashColor,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade800)),
      ),
    );
  }
}
