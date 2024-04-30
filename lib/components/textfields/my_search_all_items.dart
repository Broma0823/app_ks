import 'package:flutter/material.dart';

class MyTextField_SearchAll extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  void Function()? onTap;

  MyTextField_SearchAll(
      {super.key,
      this.controller,
      required this.hintText,
      required this.obscureText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        onTap: onTap,
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
