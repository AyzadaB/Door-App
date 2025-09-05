import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        letterSpacing: -1.5,
      ),
    );
  }
}
