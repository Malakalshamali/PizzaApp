import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  Mybutton({required this.color, required this.onPressed, required this.title});
  final Color color;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 10,
        color: color,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200,
          height: 42,
          child: Text(
            title,
            style: TextStyle(color: Colors.red[900]),
          ),
        ),
      ),
    );
  }
}
