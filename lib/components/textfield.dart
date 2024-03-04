// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';

class MyTextField_Rectangle extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final Icon icon;

  const MyTextField_Rectangle(
      {super.key,
      this.controller,
      required this.hintText,
      required this.obscureText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            icon: icon,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText),
      ),
    );
  }
}
