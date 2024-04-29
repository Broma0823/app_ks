import 'package:flutter/material.dart';

class MyTextField_Search extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField_Search({
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
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(30),
            ),
            fillColor: Theme.of(context).splashColor,
            filled: true,
            hintText: hintText),
      ),
    );
  }
}
