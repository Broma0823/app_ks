import 'package:flutter/material.dart';

class MyTextField_Rectangle extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField_Rectangle({
    super.key,
    this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: Theme.of(context).splashColor,
            filled: true,
            hintText: hintText),
      ),
    );
  }
}
