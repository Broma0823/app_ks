import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;

  const MyDrawerTile(
      {super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: ListTile(
          title: Text(
            text,
            style: const TextStyle(color: Colors.black),
          ),
          leading: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
