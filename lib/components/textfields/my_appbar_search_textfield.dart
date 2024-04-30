import 'package:flutter/material.dart';

class MySearchFieldAppBar extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final bool autofocus;

  const MySearchFieldAppBar({
    super.key,
    this.controller,
    required this.hintText,
    required this.obscureText,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        autofocus: autofocus,
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
          hintText: hintText,
          isDense: false,
          contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
        ),
      ),
    );
  }
}
