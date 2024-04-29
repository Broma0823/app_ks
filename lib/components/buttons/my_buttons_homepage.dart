import 'package:app/theme/text.dart';
import 'package:flutter/material.dart';

class MyButton1 extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;
  const MyButton1({super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: Theme.of(context).splashColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: Theme.of(context).brightness == Brightness.light
                ? TTextTheme.lightTextTheme.titleLarge
                : TTextTheme.darkTextTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
