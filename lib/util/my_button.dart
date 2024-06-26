import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  MyButton({
    super.key,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: const Color.fromRGBO(6, 22, 85, 1.0),
      child: Text(text,
        style: const TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.white,
      ),),
    );
  }
}
